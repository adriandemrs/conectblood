// script.js
const form = document.getElementById("formCadastro");
const gruposContainer = document.getElementById("gruposContainer");
let usuarios = [];
let grupos = [];

form.addEventListener("submit", function (e) {
  e.preventDefault();

  const nome = form.nome.value;
  const email = form.email.value;
  const telefone = form.telefone.value;
  const bairro = form.bairro.value;

  const novoUsuario = { nome, email, telefone, bairro };
  usuarios.push(novoUsuario);

  if (usuarios.length === 4) {
    grupos.push([...usuarios]);
    mostrarGrupo(usuarios);
    usuarios = []; // limpa para o próximo grupo
  }

  form.reset();
});

function mostrarGrupo(grupo) {
  const grupoDiv = document.createElement("div");
  grupoDiv.style.background = "#fff";
  grupoDiv.style.padding = "15px";
  grupoDiv.style.marginBottom = "20px";
  grupoDiv.style.border = "1px solid #ccc";

  grupoDiv.innerHTML = "<h3>Novo Grupo Formado!</h3>";

  grupo.forEach((pessoa, index) => {
    grupoDiv.innerHTML += `
      <p><strong>Doador ${index + 1}:</strong> ${pessoa.nome}, ${pessoa.email}, ${pessoa.telefone}, ${pessoa.bairro}</p>
    `;
  });

  grupoDiv.innerHTML += `<p><a href="https://www.fhb.df.gov.br/" target="_blank">Agendar doação no Hemocentro</a></p>`;

  gruposContainer.appendChild(grupoDiv);
}

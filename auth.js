(function () {
    const role = localStorage.getItem("userRole");
    const allowed = document.body.dataset.role;

    if (!role || !allowed || !allowed.includes(role)) {
        alert("Access denied");
        window.location.href = "index.html";
    }
})();

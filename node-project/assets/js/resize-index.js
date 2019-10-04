
function setIndexSizes() {
    // Calculate sizes based on desired layout
    // I know there's a way to do this purely using css,
    // but I find js so much easier to understand
    //
    // + ------- + ------------------ +
    // |  night  +  exhibit 1         |
    // |  sky    +                    |
    // + ----------------+  --------- +
    // | exhibit 2       |  tati gif  |
    // + ------- + ------------------ +

    // Elements
    let exhibit1Elem = $("#photo1");
    let nightSkyElem = $("#nightsky");
    let exhibit2Elem = $("#photo2");
    let tatiElem = $("#tati-photo");

    const padding = 15;
    const widthMain = $(".main").width();

    const nightSkyWidth = Math.floor(widthMain * 0.25) - padding;
    const exhibit1Width = Math.floor(widthMain * 0.75);
    const exhibit2Width =  Math.floor(widthMain * 0.64);
    const tatiWidth = (nightSkyWidth + exhibit1Width) - exhibit2Width;

    exhibit1Elem.width(exhibit1Width);
    nightSkyElem.width(nightSkyWidth);
    nightSkyElem.height(exhibit1Elem.height());
    $("#bg").height(exhibit1Elem.height());

    exhibit2Elem.width(exhibit2Width);
    tatiElem.width(tatiWidth);
    $(".index-content").css("visibility", "visible");
}

$( window ).load(function() {
    this.setIndexSizes();
});

$( window ).resize(function() {
    this.setIndexSizes();
});

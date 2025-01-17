{ stdenv
, lib
, fetchurl
, gtk3
, glib
, pkg-config
, libpng
, zlib
}:

stdenv.mkDerivation rec {
  pname = "xmedcon";
  version = "0.21.2";

  src = fetchurl {
    url = "https://prdownloads.sourceforge.net/${pname}/${pname}-${version}.tar.bz2";
    sha256 = "0svff8rc3j2p47snaq1hx9mv4ydmxawpb0hf3d165g1ccjwvmm6m";
  };

  buildInputs = [
    gtk3
    glib
    libpng
    zlib
  ];

  nativeBuildInputs = [ pkg-config ];

  meta = with lib; {
    description = "An open source toolkit for medical image conversion ";
    homepage = "https://xmedcon.sourceforge.io/Main/HomePage";
    license = licenses.lgpl2Plus;
    maintainers = with maintainers; [ arianvp flokli ];
    platforms = platforms.darwin ++ platforms.linux;
  };
}

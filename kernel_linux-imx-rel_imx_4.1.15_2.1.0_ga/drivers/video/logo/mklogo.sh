file=$1
width=$2
high=$3

echo "input file:"${file}", size:" ${width}"x"${high} 

convert -resize ${width}x${high}! $file logo2.png
pngtopnm logo2.png > logo3.pnm
pnmquant 224 logo3.pnm > logo4.pnm
pnmtoplainpnm logo4.pnm > logo_topeet_clut224.ppm

rm -rf logo2.png logo3.pnm logo4.pnm

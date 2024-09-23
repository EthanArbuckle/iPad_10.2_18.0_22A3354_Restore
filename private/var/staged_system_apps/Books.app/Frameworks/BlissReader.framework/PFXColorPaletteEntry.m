@implementation PFXColorPaletteEntry

- (PFXColorPaletteEntry)initWithColorName:(id)a3 red:(double)a4 green:(double)a5 blue:(double)a6
{
  PFXColorPaletteEntry *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PFXColorPaletteEntry;
  v10 = -[PFXColorPaletteEntry init](&v12, "init");
  if (v10)
  {
    v10->mColorName = (NSString *)objc_msgSend(a3, "copy");
    v10->mRed = a4;
    v10->mGreen = a5;
    v10->mBlue = a6;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXColorPaletteEntry;
  -[PFXColorPaletteEntry dealloc](&v3, "dealloc");
}

+ (id)colorPaletteMap
{
  id result;

  result = (id)qword_5436C8;
  if (!qword_5436C8)
  {
    result = objc_alloc_init((Class)NSMutableDictionary);
    qword_5436C8 = (uint64_t)result;
  }
  return result;
}

+ (void)addEntryForColor:(id)a3 red:(double)a4 green:(double)a5 blue:(double)a6
{
  PFXColorPaletteEntry *v8;

  v8 = -[PFXColorPaletteEntry initWithColorName:red:green:blue:]([PFXColorPaletteEntry alloc], "initWithColorName:red:green:blue:", objc_msgSend(a3, "lowercaseString"), a4, a5, a6);
  objc_msgSend(objc_msgSend(a1, "colorPaletteMap"), "setObject:forKey:", v8, a3);

}

+ (void)initialize
{
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("aqua"), 0.0, 1.0, 1.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("black"), 0.0, 0.0, 0.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("blue"), 0.0, 0.0, 1.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("fuchsia"), 1.0, 0.0, 1.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("gray"), 0.501960784, 0.501960784, 0.501960784);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("green"), 0.0, 0.501960784, 0.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("lime"), 0.0, 1.0, 0.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("maroon"), 0.501960784, 0.0, 0.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("navy"), 0.0, 0.0, 0.501960784);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("olive"), 0.501960784, 0.501960784, 0.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("purple"), 0.501960784, 0.0, 0.501960784);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("red"), 1.0, 0.0, 0.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("silver"), 0.752941176, 0.752941176, 0.752941176);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("teal"), 0.0, 0.501960784, 0.501960784);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("white"), 1.0, 1.0, 1.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("yellow"), 1.0, 1.0, 0.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("aliceblue"), 0.941176471, 0.97254902, 1.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("antiquewhite"));
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("aquamarine"), 0.498039216, 1.0, 0.831372549);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("azure"), 0.941176471, 1.0, 1.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("beige"), 0.960784314, 0.960784314, 0.862745098);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("bisque"), 1.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("blanchedalmond"), 1.0, 0.921568627);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("blueviolet"), 0.541176471, 0.168627451, 0.88627451);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("brown"));
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("burlywood"));
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("cadetblue"), 0.37254902, 0.619607843);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("chartreuse"), 0.498039216, 1.0, 0.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("chocolate"));
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("coral"), 1.0, 0.498039216, 0.31372549);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("cornflowerblue"), 0.392156863, 0.584313725, 0.929411765);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("cornsilk"), 1.0, 0.97254902, 0.862745098);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("crimson"), 0.862745098, 0.0784313725);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("cyan"), 0.0, 1.0, 1.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("darkblue"), 0.0, 0.0, 0.545098039);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("darkcyan"), 0.0, 0.545098039, 0.545098039);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("darkgoldenrod"), 0.721568627, 0.525490196, 0.0431372549);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("darkgray"), 0.662745098, 0.662745098, 0.662745098);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("darkgreen"), 0.0, 0.392156863, 0.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("darkkhaki"), 0.741176471, 0.717647059, 0.419607843);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("darkmagenta"), 0.545098039, 0.0, 0.545098039);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("darkolivegreen"));
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("darkorange"), 1.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("darkorchid"));
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("darkred"), 0.545098039, 0.0, 0.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("darksalmon"), 0.91372549, 0.588235294);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("darkseagreen"));
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("darkslateblue"));
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("darkslategray"), 0.184313725, 0.309803922, 0.309803922);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("darkturquoise"), 0.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("darkviolet"), 0.580392157, 0.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("deeppink"), 1.0, 0.0784313725);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("deepskyblue"), 0.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("dimgray"), 0.411764706, 0.411764706, 0.411764706);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("dodgerblue"), 0.117647059);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("firebrick"));
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("floralwhite"), 1.0, 0.980392157, 0.941176471);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("forestgreen"), 0.133333333, 0.545098039, 0.133333333);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("gainsboro"), 0.862745098, 0.862745098, 0.862745098);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("ghostwhite"), 0.97254902, 0.97254902, 1.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("gold"), 1.0, 0.843137255, 0.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("goldenrod"));
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("greenyellow"), 0.678431373, 1.0, 0.184313725);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("honeydew"), 0.941176471, 1.0, 0.941176471);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("hotpink"), 1.0, 0.411764706);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("indianred"), 0.803921569, 0.360784314, 0.360784314);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("indigo"), 0.294117647, 0.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("ivory"), 1.0, 1.0, 0.941176471);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("khaki"), 0.941176471, 0.901960784, 0.549019608);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("lavender"), 0.901960784, 0.901960784, 0.980392157);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("lavenderblush"), 1.0, 0.941176471, 0.960784314);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("lawngreen"), 0.48627451, 0.988235294, 0.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("lemonchiffon"), 1.0, 0.980392157, 0.803921569);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("lightblue"), 0.678431373);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("lightcoral"), 0.941176471, 0.501960784, 0.501960784);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("lightcyan"), 0.878431373, 1.0, 1.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("lightgoldenrodyellow"), 0.980392157, 0.980392157, 0.823529412);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("lightgreen"), 0.564705882, 0.933333333, 0.564705882);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("lightgrey"), 0.82745098, 0.82745098, 0.82745098);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("lightpink"), 1.0, 0.71372549, 0.756862745);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("lightsalmon"), 1.0, 0.62745098, 0.478431373);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("lightseagreen"), 0.125490196, 0.698039216, 0.666666667);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("lightskyblue"), 0.529411765, 0.807843137, 0.980392157);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("lightslategray"), 0.466666667, 0.533333333, 0.6);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("lightsteelblue"));
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("lightyellow"), 1.0, 1.0, 0.878431373);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("limegreen"), 0.196078431, 0.803921569, 0.196078431);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("linen"), 0.980392157, 0.941176471, 0.901960784);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("magenta"), 1.0, 0.0, 1.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("mediumaquamarine"), 0.4, 0.803921569, 0.666666667);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("mediumblue"), 0.0, 0.0, 0.803921569);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("mediumorchid"), 0.729411765, 0.333333333, 0.82745098);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("mediumpurple"), 0.576470588, 0.439215686);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("mediumseagreen"), 0.235294118);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("mediumslateblue"), 0.482352941, 0.407843137, 0.933333333);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("mediumspringgreen"), 0.0, 0.980392157, 0.603921569);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("mediumturquoise"), 0.282352941, 0.819607843, 0.8);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("mediumvioletred"), 0.780392157, 0.0823529412, 0.521568627);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("midnightblue"), 0.0980392157, 0.0980392157, 0.439215686);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("mintcream"), 0.960784314, 1.0, 0.980392157);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("mistyrose"), 1.0, 0.894117647);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("moccasin"), 1.0, 0.894117647, 0.709803922);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("navajowhite"), 1.0, 0.870588235, 0.678431373);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("navyblue"), 0.623529412, 0.68627451, 0.874509804);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("oldlace"), 0.992156863, 0.960784314, 0.901960784);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("olivedrab"), 0.419607843, 0.556862745, 0.137254902);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("orange"), 1.0, 0.647058824, 0.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("orangered"), 1.0, 0.270588235, 0.0);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("orchid"), 0.854901961, 0.439215686, 0.839215686);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("palegoldenrod"), 0.933333333, 0.909803922, 0.666666667);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("palegreen"), 0.596078431, 0.984313725, 0.596078431);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("paleturquoise"), 0.68627451, 0.933333333, 0.933333333);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("palevioletred"), 0.858823529, 0.439215686, 0.576470588);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("papayawhip"), 1.0, 0.937254902, 0.835294118);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("peachpuff"), 1.0, 0.854901961, 0.725490196);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("peru"), 0.803921569, 0.521568627, 0.247058824);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("pink"), 1.0, 0.752941176, 0.796078431);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("plum"), 0.866666667, 0.62745098, 0.866666667);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("powderblue"), 0.690196078, 0.878431373, 0.901960784);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("rosybrown"), 0.737254902, 0.560784314, 0.560784314);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("royalblue"), 0.254901961, 0.411764706, 0.882352941);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("saddlebrown"), 0.545098039, 0.270588235, 0.0745098039);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("salmon"), 0.980392157, 0.501960784, 0.447058824);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("sandybrown"), 0.956862745, 0.643137255, 0.376470588);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("seagreen"), 0.180392157, 0.545098039, 0.341176471);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("seashell"), 1.0, 0.960784314, 0.933333333);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("sienna"), 0.62745098, 0.321568627, 0.176470588);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("skyblue"), 0.529411765, 0.807843137, 0.921568627);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("slateblue"), 0.415686275, 0.352941176, 0.803921569);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("slategray"), 0.439215686, 0.501960784, 0.564705882);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("snow"), 1.0, 0.980392157, 0.980392157);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("springgreen"), 0.0, 1.0, 0.498039216);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("steelblue"), 0.274509804, 0.509803922, 0.705882353);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("tan"), 0.823529412, 0.705882353, 0.549019608);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("thistle"), 0.847058824, 0.749019608, 0.847058824);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("tomato"), 1.0, 0.388235294, 0.278431373);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("turquoise"), 0.250980392, 0.878431373, 0.815686275);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("violet"), 0.933333333, 0.509803922, 0.933333333);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("wheat"), 0.960784314, 0.870588235, 0.701960784);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("whitesmoke"), 0.960784314, 0.960784314, 0.960784314);
  objc_msgSend(a1, "addEntryForColor:red:green:blue:", CFSTR("yellowgreen"), 0.545098039, 0.803921569, 0.196078431);
}

+ (id)entryForColor:(id)a3
{
  return objc_msgSend(objc_msgSend(a1, "colorPaletteMap"), "objectForKey:", objc_msgSend(a3, "lowercaseString"));
}

- (NSString)colorName
{
  return self->mColorName;
}

- (double)red
{
  return self->mRed;
}

- (double)blue
{
  return self->mBlue;
}

- (double)green
{
  return self->mGreen;
}

@end

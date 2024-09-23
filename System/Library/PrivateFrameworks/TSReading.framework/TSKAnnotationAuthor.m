@implementation TSKAnnotationAuthor

- (NSString)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
  NSString *v5;

  -[TSPObject willModify](self, "willModify");
  v5 = (NSString *)objc_msgSend(a3, "copy");

  self->mName = v5;
}

- (TSUColor)storageColor
{
  return self->mColor;
}

- (void)setStorageColor:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mColor = (TSUColor *)a3;
}

- (TSKAnnotationAuthor)initWithContext:(id)a3 name:(id)a4 color:(id)a5
{
  TSKAnnotationAuthor *v9;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  objc_super v15;

  if (a4)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAnnotationAuthor initWithContext:name:color:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 39, CFSTR("Invalid parameter not satisfying: %s"), "name != nil");
    if (a5)
      goto LABEL_3;
  }
  v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAnnotationAuthor initWithContext:name:color:]");
  objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 40, CFSTR("Invalid parameter not satisfying: %s"), "color != nil");
LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)TSKAnnotationAuthor;
  v9 = -[TSPObject initWithContext:](&v15, sel_initWithContext_, a3);
  if (v9)
  {
    v9->mName = (NSString *)objc_msgSend(a4, "copy");
    v9->mColor = (TSUColor *)a5;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKAnnotationAuthor;
  -[TSKAnnotationAuthor dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  int v5;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v4 = (void *)TSUDynamicCast();
      v5 = -[TSUColor isEqual:](self->mColor, "isEqual:", objc_msgSend(v4, "storageColor"));
      if (v5)
        LOBYTE(v5) = -[NSString isEqualToString:](self->mName, "isEqualToString:", objc_msgSend(v4, "name"));
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSKAnnotationAuthor;
  v3 = -[TSKAnnotationAuthor hash](&v6, sel_hash);
  v4 = -[NSString hash](self->mName, "hash") ^ v3;
  return v4 ^ -[TSUColor hash](self->mColor, "hash");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<TSKAnnotationAuthor: %p name %@ color %@>"), self, self->mName, self->mColor);
}

- (unint64_t)p_authorColorIndex
{
  TSUColor *v2;
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  double v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;

  v2 = -[TSKAnnotationAuthor storageColor](self, "storageColor");
  if (!+[TSKAnnotationAuthor presetColorCount](TSKAnnotationAuthor, "presetColorCount"))
    goto LABEL_7;
  v3 = 0;
  while ((objc_msgSend(+[TSKAnnotationAuthor authorStorageColorForIndex:](TSKAnnotationAuthor, "authorStorageColorForIndex:", v3), "isEqual:", v2) & 1) == 0)
  {
    if (++v3 >= +[TSKAnnotationAuthor presetColorCount](TSKAnnotationAuthor, "presetColorCount"))
      goto LABEL_7;
  }
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_7:
    -[TSUColor redComponent](v2, "redComponent");
    v5 = v4;
    -[TSUColor greenComponent](v2, "greenComponent");
    v7 = v6;
    -[TSUColor blueComponent](v2, "blueComponent");
    v9 = v8;
    if (!+[TSKAnnotationAuthor presetColorCount](TSKAnnotationAuthor, "presetColorCount"))
    {
LABEL_14:
      v20 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAnnotationAuthor p_authorColorIndex]");
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 133, CFSTR("Should have found a color"));
      return 0;
    }
    v10 = 0;
    v3 = 0x7FFFFFFFFFFFFFFFLL;
    v11 = 1.79769313e308;
    do
    {
      v12 = +[TSKAnnotationAuthor authorStorageColorForIndex:](TSKAnnotationAuthor, "authorStorageColorForIndex:", v10);
      if (v12)
      {
        v13 = v12;
        objc_msgSend(v12, "redComponent");
        v15 = v14;
        objc_msgSend(v13, "greenComponent");
        v17 = v16;
        objc_msgSend(v13, "blueComponent");
        v19 = sqrt((v17 - v7) * (v17 - v7) + (v15 - v5) * (v15 - v5) + (v18 - v9) * (v18 - v9));
        if (v19 < v11)
        {
          v11 = v19;
          v3 = v10;
        }
      }
      ++v10;
    }
    while (v10 < +[TSKAnnotationAuthor presetColorCount](TSKAnnotationAuthor, "presetColorCount"));
  }
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_14;
  return v3;
}

- (TSUColor)textMarkupColor
{
  return (TSUColor *)+[TSKAnnotationAuthor authorTextMarkupColorForIndex:](TSKAnnotationAuthor, "authorTextMarkupColorForIndex:", -[TSKAnnotationAuthor p_authorColorIndex](self, "p_authorColorIndex"));
}

- (TSUColor)textHighlightColor
{
  return (TSUColor *)+[TSKAnnotationAuthor authorTextHighlightColorForIndex:](TSKAnnotationAuthor, "authorTextHighlightColorForIndex:", -[TSKAnnotationAuthor p_authorColorIndex](self, "p_authorColorIndex"));
}

- (TSUColor)cellViolatorColor
{
  return (TSUColor *)+[TSKAnnotationAuthor authorCellViolatorColorForIndex:](TSKAnnotationAuthor, "authorCellViolatorColorForIndex:", -[TSKAnnotationAuthor p_authorColorIndex](self, "p_authorColorIndex"));
}

- (TSUColor)flagStrokeColor
{
  return (TSUColor *)+[TSKAnnotationAuthor authorFlagStrokeColorForIndex:](TSKAnnotationAuthor, "authorFlagStrokeColorForIndex:", -[TSKAnnotationAuthor p_authorColorIndex](self, "p_authorColorIndex"));
}

- (TSUColor)flagPressedColor
{
  return (TSUColor *)+[TSKAnnotationAuthor authorFlagPressedColorForIndex:](TSKAnnotationAuthor, "authorFlagPressedColorForIndex:", -[TSKAnnotationAuthor p_authorColorIndex](self, "p_authorColorIndex"));
}

- (TSUColor)changeAdornmentsColor
{
  return (TSUColor *)+[TSKAnnotationAuthor authorChangeAdornmentsColorForIndex:](TSKAnnotationAuthor, "authorChangeAdornmentsColorForIndex:", -[TSKAnnotationAuthor p_authorColorIndex](self, "p_authorColorIndex"));
}

- (TSUColor)flagFillColor
{
  return (TSUColor *)+[TSKAnnotationAuthor authorFlagFillColorForIndex:](TSKAnnotationAuthor, "authorFlagFillColorForIndex:", -[TSKAnnotationAuthor p_authorColorIndex](self, "p_authorColorIndex"));
}

- (TSUColor)popoverColor
{
  return (TSUColor *)+[TSKAnnotationAuthor authorPopoverColorForIndex:](TSKAnnotationAuthor, "authorPopoverColorForIndex:", -[TSKAnnotationAuthor p_authorColorIndex](self, "p_authorColorIndex"));
}

+ (unint64_t)presetColorCount
{
  return 8;
}

+ (id)authorStorageColorForIndex:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;

  if (+[TSKAnnotationAuthor authorStorageColorForIndex:]::onceToken != -1)
    dispatch_once(&+[TSKAnnotationAuthor authorStorageColorForIndex:]::onceToken, &__block_literal_global_15);
  if (a3 >= 8)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSKAnnotationAuthor authorStorageColorForIndex:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 227, CFSTR("author color id not defined"));
  }
  v6 = 8;
  if (a3 < 8)
    v6 = a3;
  return (id)+[TSKAnnotationAuthor authorStorageColorForIndex:]::sAuthorColors[v6];
}

id __50__TSKAnnotationAuthor_authorStorageColorForIndex___block_invoke()
{
  uint64_t v0;
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  id result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v0 = 0;
  v10 = 0x3FEB3B3B40000000;
  v9 = 0x3FE5757580000000;
  v8 = 0x3FEDDDDDE0000000;
  do
  {
    switch(v0)
    {
      case 0:
        v1 = (void *)MEMORY[0x24BEB3C40];
        v2 = 1.0;
        v3 = 0.980392158;
        v5 = 0.352941185;
        v4 = 0.937254906;
        goto LABEL_13;
      case 1:
        v1 = (void *)MEMORY[0x24BEB3C40];
        v2 = 1.0;
        v4 = 0.941176474;
        v3 = 0.749019623;
        goto LABEL_11;
      case 2:
        v1 = (void *)MEMORY[0x24BEB3C40];
        v2 = 1.0;
        v4 = 0.800000012;
        v3 = 0.68235296;
        v5 = 0.988235295;
        goto LABEL_13;
      case 3:
        v1 = (void *)MEMORY[0x24BEB3C40];
        v2 = 1.0;
        v3 = 0.980392158;
        v5 = 0.823529422;
        v4 = 0.666666687;
        goto LABEL_13;
      case 4:
        v1 = (void *)MEMORY[0x24BEB3C40];
        v2 = 1.0;
        v4 = *(double *)&v9;
        v3 = *(double *)&v10;
        v5 = *(double *)&v8;
        goto LABEL_13;
      case 5:
        v1 = (void *)MEMORY[0x24BEB3C40];
        v2 = 1.0;
        v3 = 0.552941203;
        v4 = 0.854901969;
        v5 = 0.792156875;
        goto LABEL_13;
      case 6:
        v1 = (void *)MEMORY[0x24BEB3C40];
        v2 = 1.0;
        v3 = 0.960784316;
        v4 = 0.694117665;
LABEL_11:
        v5 = 0.301960796;
        goto LABEL_13;
      case 7:
        v1 = (void *)MEMORY[0x24BEB3C40];
        v2 = 1.0;
        v3 = 0.87843138;
        v4 = 0.87843138;
        v5 = 0.87843138;
LABEL_13:
        v6 = (void *)objc_msgSend(v1, "colorWithRed:green:blue:alpha:", v3, v4, v5, v2, v8, v9, v10);
        break;
      default:
        v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C40], "blackColor");
        break;
    }
    result = v6;
    +[TSKAnnotationAuthor authorStorageColorForIndex:]::sAuthorColors[v0++] = result;
  }
  while (v0 != 9);
  return result;
}

+ (id)authorTextMarkupColorForIndex:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__TSKAnnotationAuthor_authorTextMarkupColorForIndex___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (+[TSKAnnotationAuthor authorTextMarkupColorForIndex:]::onceToken != -1)
    dispatch_once(&+[TSKAnnotationAuthor authorTextMarkupColorForIndex:]::onceToken, block);
  if (a3 >= 8)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSKAnnotationAuthor authorTextMarkupColorForIndex:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 275, CFSTR("author color id not defined"));
  }
  v6 = 8;
  if (a3 < 8)
    v6 = a3;
  return (id)+[TSKAnnotationAuthor authorTextMarkupColorForIndex:]::sAuthorColors[v6];
}

id __53__TSKAnnotationAuthor_authorTextMarkupColorForIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id result;
  uint64_t v10;

  v2 = 0;
  v10 = 0x3FE4747480000000;
  do
  {
    switch(*(_QWORD *)(a1 + 32))
    {
      case 0:
        v3 = (void *)MEMORY[0x24BEB3C40];
        v4 = 0.0;
        v5 = 1.0;
        v7 = 0.596078455;
        v6 = 0.75686276;
        goto LABEL_12;
      case 1:
        v3 = (void *)MEMORY[0x24BEB3C40];
        v4 = 0.0;
        v5 = 1.0;
        v6 = 0.478431374;
        v7 = 0.647058845;
        goto LABEL_12;
      case 2:
        v3 = (void *)MEMORY[0x24BEB3C40];
        v5 = 1.0;
        v7 = 0.529411793;
        v6 = 0.329411775;
        v4 = 0.80392158;
        goto LABEL_12;
      case 3:
        v3 = (void *)MEMORY[0x24BEB3C40];
        v5 = 1.0;
        v7 = 0.301960796;
        v6 = 0.713725507;
        v4 = 0.541176498;
        goto LABEL_12;
      case 4:
        v3 = (void *)MEMORY[0x24BEB3C40];
        v5 = 1.0;
        v6 = *(double *)&v10;
        v7 = 0.407843143;
        v4 = 0.866666675;
        goto LABEL_12;
      case 5:
        v3 = (void *)MEMORY[0x24BEB3C40];
        v5 = 1.0;
        v6 = 0.156862751;
        v7 = 0.53725493;
        v4 = 0.458823532;
        goto LABEL_12;
      case 6:
        v3 = (void *)MEMORY[0x24BEB3C40];
        v5 = 1.0;
        v6 = 0.647058845;
        v7 = 0.427450985;
        v4 = 0.0862745121;
        goto LABEL_12;
      case 7:
        v3 = (void *)MEMORY[0x24BEB3C40];
        v5 = 1.0;
        v6 = 0.427450985;
        v7 = 0.427450985;
        v4 = 0.427450985;
LABEL_12:
        v8 = (void *)objc_msgSend(v3, "colorWithRed:green:blue:alpha:", v6, v7, v4, v5, v10);
        break;
      default:
        v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C40], "blackColor");
        break;
    }
    result = v8;
    +[TSKAnnotationAuthor authorTextMarkupColorForIndex:]::sAuthorColors[v2++] = (uint64_t)result;
  }
  while (v2 != 9);
  return result;
}

+ (id)authorChangeAdornmentsColorForIndex:(unint64_t)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id result;
  double v11;

  switch(a3)
  {
    case 0uLL:
      v3 = (void *)MEMORY[0x24BEB3C40];
      v4 = 0.992156863;
      v5 = 0.815686285;
      v6 = 0.211764708;
      goto LABEL_10;
    case 1uLL:
      v3 = (void *)MEMORY[0x24BEB3C40];
      v4 = 0.674509823;
      v5 = 0.858823538;
      v6 = 0.156862751;
      goto LABEL_10;
    case 2uLL:
      v3 = (void *)MEMORY[0x24BEB3C40];
      v4 = 0.627451003;
      v5 = 0.749019623;
      v6 = 0.917647064;
      goto LABEL_10;
    case 3uLL:
      v3 = (void *)MEMORY[0x24BEB3C40];
      v4 = 0.952941179;
      v5 = 0.666666687;
      v6 = 0.796078444;
      goto LABEL_10;
    case 4uLL:
      v3 = (void *)MEMORY[0x24BEB3C40];
      v4 = 0.729411781;
      v5 = 0.509803951;
      v6 = 0.996078432;
      goto LABEL_10;
    case 5uLL:
      v3 = (void *)MEMORY[0x24BEB3C40];
      v4 = 0.407843143;
      v5 = 0.749019623;
      v6 = 0.678431392;
      goto LABEL_10;
    case 6uLL:
      v3 = (void *)MEMORY[0x24BEB3C40];
      v4 = 0.984313726;
      v5 = 0.674509823;
      v6 = 0.254901975;
LABEL_10:
      v11 = 1.0;
      goto LABEL_11;
    case 7uLL:
      v3 = (void *)MEMORY[0x24BEB3C40];
      v4 = 0.87843138;
      v11 = 1.0;
      v5 = 0.87843138;
      v6 = 0.87843138;
LABEL_11:
      result = (id)objc_msgSend(v3, "colorWithRed:green:blue:alpha:", v4, v5, v6, v11);
      break;
    default:
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C40], "blackColor");
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSKAnnotationAuthor authorChangeAdornmentsColorForIndex:]");
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 333, CFSTR("author color id not defined"));
      result = v7;
      break;
  }
  return result;
}

+ (id)authorPopoverColorForIndex:(unint64_t)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id result;
  double v11;

  switch(a3)
  {
    case 0uLL:
      v3 = (void *)MEMORY[0x24BEB3C40];
      v4 = 0.984313726;
      v5 = 0.945098042;
      v6 = 0.490196079;
      goto LABEL_10;
    case 1uLL:
      v3 = (void *)MEMORY[0x24BEB3C40];
      v4 = 0.749019623;
      v5 = 0.941176474;
      v6 = 0.301960796;
      goto LABEL_10;
    case 2uLL:
      v3 = (void *)MEMORY[0x24BEB3C40];
      v4 = 0.733333349;
      v5 = 0.839215696;
      v6 = 0.984313726;
      goto LABEL_10;
    case 3uLL:
      v3 = (void *)MEMORY[0x24BEB3C40];
      v5 = 0.730000019;
      v6 = 0.850000024;
      v4 = 1.0;
      goto LABEL_10;
    case 4uLL:
      v3 = (void *)MEMORY[0x24BEB3C40];
      v4 = 0.850980401;
      v5 = 0.670588255;
      v6 = 0.933333337;
      goto LABEL_10;
    case 5uLL:
      v3 = (void *)MEMORY[0x24BEB3C40];
      v4 = 0.552941203;
      v5 = 0.854901969;
      v6 = 0.792156875;
      goto LABEL_10;
    case 6uLL:
      v3 = (void *)MEMORY[0x24BEB3C40];
      v4 = 0.970000029;
      v6 = 0.370000005;
      v5 = 0.75;
LABEL_10:
      v11 = 1.0;
      goto LABEL_11;
    case 7uLL:
      v3 = (void *)MEMORY[0x24BEB3C40];
      v4 = 0.956862748;
      v11 = 1.0;
      v5 = 0.956862748;
      v6 = 0.956862748;
LABEL_11:
      result = (id)objc_msgSend(v3, "colorWithRed:green:blue:alpha:", v4, v5, v6, v11);
      break;
    default:
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C40], "blackColor");
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSKAnnotationAuthor authorPopoverColorForIndex:]");
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 376, CFSTR("author color id not defined"));
      result = v7;
      break;
  }
  return result;
}

+ (id)authorColorAppearanceNameForIndex:(unint64_t)a3
{
  void *v4;
  uint64_t v5;

  if (a3 < 8)
    return off_24D82ABD8[a3];
  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSKAnnotationAuthor authorColorAppearanceNameForIndex:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 416, CFSTR("author color id not defined"));
  return CFSTR("Unknown");
}

+ (id)authorColorNameForIndex:(unint64_t)a3
{
  void *v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  id result;

  switch(a3)
  {
    case 0uLL:
      v3 = (void *)TSKBundle();
      v4 = CFSTR("Yellow");
      goto LABEL_11;
    case 1uLL:
      v3 = (void *)TSKBundle();
      v4 = CFSTR("Green");
      goto LABEL_11;
    case 2uLL:
      v3 = (void *)TSKBundle();
      v4 = CFSTR("Blue");
      goto LABEL_11;
    case 3uLL:
      v3 = (void *)TSKBundle();
      v4 = CFSTR("Pink");
      goto LABEL_11;
    case 4uLL:
      v3 = (void *)TSKBundle();
      v4 = CFSTR("Purple");
      goto LABEL_11;
    case 5uLL:
      v3 = (void *)TSKBundle();
      v4 = CFSTR("Teal");
      goto LABEL_11;
    case 6uLL:
      v3 = (void *)TSKBundle();
      v4 = CFSTR("Orange");
      goto LABEL_11;
    case 7uLL:
      v3 = (void *)TSKBundle();
      v4 = CFSTR("Gray");
LABEL_11:
      result = (id)objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_24D82FEB0, CFSTR("TSKit"));
      break;
    default:
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSKAnnotationAuthor authorColorNameForIndex:]");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 454, CFSTR("author color id not defined"));
      result = CFSTR("Unknown");
      break;
  }
  return result;
}

+ (id)defaultAuthorName
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "localizedModel");
}

- (id)componentRootObject
{
  return (id)objc_msgSend(-[TSPObject documentRoot](self, "documentRoot"), "annotationAuthorStorage");
}

- (BOOL)allowsImplicitComponentOwnership
{
  return 0;
}

@end

@implementation THWInteractiveImageCalloutStyleProvider

- (THWInteractiveImageCalloutStyleProvider)initWithStorage:(id)a3
{
  THWInteractiveImageCalloutStyleProvider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWInteractiveImageCalloutStyleProvider;
  v4 = -[THWInteractiveImageCalloutStyleProvider init](&v6, "init");
  if (v4)
  {
    v4->_storage = (TSWPStorage *)a3;
    v4->_fontScale = 1.0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageCalloutStyleProvider;
  -[THWInteractiveImageCalloutStyleProvider dealloc](&v3, "dealloc");
}

- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  id v7;
  id v8;
  float v9;
  double v10;

  v7 = +[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap");
  if (self->_selected)
    objc_msgSend(v7, "setObject:forProperty:", +[TSUColor whiteColor](TSUColor, "whiteColor"), 18);
  v8 = objc_msgSend(+[TSWPStorageStyleProvider styleProviderForStorage:](TSWPStorageStyleProvider, "styleProviderForStorage:", self->_storage), "paragraphStyleAtParIndex:effectiveRange:", a3, a4);
  objc_msgSend(v8, "floatValueForProperty:", 17);
  v10 = self->_fontScale * v9;
  *(float *)&v10 = v10;
  objc_msgSend(v7, "setFloatValue:forProperty:", 17, v10);
  return objc_msgSend(objc_msgSend(v8, "stylesheet"), "variationOfStyle:propertyMap:", v8, v7);
}

- (id)modifiedCharacterStyle:(id)a3 atCharIndex:(unint64_t)a4
{
  id v6;
  float v7;
  double v8;

  v6 = +[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap", a3, a4);
  objc_msgSend(a3, "floatValueForProperty:", 17);
  v8 = self->_fontScale * v7;
  *(float *)&v8 = v8;
  objc_msgSend(v6, "setFloatValue:forProperty:", 17, v8);
  if (self->_selected)
    objc_msgSend(v6, "setObject:forProperty:", +[TSUColor whiteColor](TSUColor, "whiteColor"), 18);
  return objc_msgSend(objc_msgSend(a3, "stylesheet"), "variationOfStyle:propertyMap:", a3, v6);
}

- (TSWPStorage)storage
{
  return self->_storage;
}

- (double)fontScale
{
  return self->_fontScale;
}

- (void)setFontScale:(double)a3
{
  self->_fontScale = a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

@end

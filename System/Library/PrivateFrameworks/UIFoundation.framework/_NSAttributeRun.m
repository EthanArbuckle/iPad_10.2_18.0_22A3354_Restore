@implementation _NSAttributeRun

- (_NSAttributeRun)initWithTextStorage:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _NSAttributeRun *v7;
  _NSAttributeRun *v8;
  NSUInteger v9;
  uint64_t v10;
  _NSAttributes *v11;
  _NSAttributes *v12;
  objc_super v14;
  uint64_t v15;
  uint64_t v16;

  length = a4.length;
  location = a4.location;
  v15 = 0;
  v16 = 0;
  v14.receiver = self;
  v14.super_class = (Class)_NSAttributeRun;
  v7 = -[_NSAttributeRun init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_range.location = location;
    v7->_range.length = length;
    v7->_attributesArray = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", -[_NSAttributeRun zone](v7, "zone")), "init");
    if (location < location + length)
    {
      v9 = location;
      do
      {
        v10 = objc_msgSend(a3, "attributesAtIndex:longestEffectiveRange:inRange:", v9, &v15, location, length);
        v11 = [_NSAttributes alloc];
        v12 = -[_NSAttributes initWithAttributes:range:](v11, "initWithAttributes:range:", v10, v15, v16);
        -[NSMutableArray addObject:](v8->_attributesArray, "addObject:", v12);

        v9 += v16;
      }
      while (v9 < location + length);
    }
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_attributesArray = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSAttributeRun;
  -[_NSAttributeRun dealloc](&v3, sel_dealloc);
}

- (void)restoreAttributesOfTextStorage:(id)a3
{
  uint64_t v5;
  uint64_t i;

  v5 = -[NSMutableArray count](self->_attributesArray, "count");
  objc_msgSend(a3, "beginEditing");
  if (v5)
  {
    for (i = 0; i != v5; ++i)
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_attributesArray, "objectAtIndex:", i), "setAttributesInTextStorage:", a3);
  }
  objc_msgSend(a3, "endEditing");
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

@end

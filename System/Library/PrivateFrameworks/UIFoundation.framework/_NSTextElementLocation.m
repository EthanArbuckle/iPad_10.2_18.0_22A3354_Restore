@implementation _NSTextElementLocation

- (_NSTextElementLocation)initWithTextElement:(id)a3 baseLocation:(id)a4 offset:(int64_t)a5
{
  uint64_t v9;
  void *v10;
  _NSTextElementLocation *v11;
  _NSTextElementLocation *v12;
  objc_super v14;

  v9 = objc_msgSend(a3, "textContentManager");
  if (v9 && (v10 = (void *)v9, (objc_msgSend((id)objc_msgSend(a3, "elementRange"), "containsLocation:", a4) & 1) != 0))
  {
    v14.receiver = self;
    v14.super_class = (Class)_NSTextElementLocation;
    v11 = -[NSCountableTextLocation initWithIndex:](&v14, sel_initWithIndex_, objc_msgSend(v10, "offsetFromLocation:toLocation:", objc_msgSend((id)objc_msgSend(v10, "documentRange"), "location"), a4));
    v12 = v11;
    if (v11)
    {
      v11->_textElement = (NSTextElement *)a3;
      v11->_baseLocation = (NSTextLocation *)a4;
      v12->_offset = a5;
    }
  }
  else
  {

    return 0;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  self->_textElement = 0;

  self->_baseLocation = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSTextElementLocation;
  -[_NSTextElementLocation dealloc](&v3, sel_dealloc);
}

- (void)updateBaseLocation
{
  id v3;
  NSTextContentManager *v4;

  v3 = -[NSTextRange location](-[NSTextElement elementRange](self->_textElement, "elementRange"), "location");
  if ((-[NSTextLocation isEqual:](self->_baseLocation, "isEqual:", v3) & 1) == 0)
  {
    v4 = -[NSTextElement textContentManager](self->_textElement, "textContentManager");
    if (v4)
      -[NSCountableTextLocation setCharacterIndex:](self, "setCharacterIndex:", -[NSTextContentManager offsetFromLocation:toLocation:](v4, "offsetFromLocation:toLocation:", -[NSTextRange location](-[NSTextContentManager documentRange](v4, "documentRange"), "location"), v3));

    self->_baseLocation = (NSTextLocation *)v3;
  }
}

- (int64_t)compare:(id)a3
{
  id v5;
  int64_t v6;
  int64_t offset;
  int64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_NSTextElementLocation;
  v5 = -[NSCountableTextLocation compare:](&v10, sel_compare_);
  if (!v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = *((_QWORD *)a3 + 4);
    else
      v6 = 0;
    offset = self->_offset;
    v8 = -1;
    if (offset >= v6)
      v8 = 1;
    if (v6 != offset)
      return v8;
  }
  return (int64_t)v5;
}

- (BOOL)isEqualToTextLocation:(id)a3
{
  return -[_NSTextElementLocation compare:](self, "compare:", a3) == 0;
}

- (NSTextElement)textElement
{
  return self->_textElement;
}

- (void)setTextElement:(id)a3
{
  self->_textElement = (NSTextElement *)a3;
}

- (NSTextLocation)baseLocation
{
  return (NSTextLocation *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)offset
{
  return self->_offset;
}

@end

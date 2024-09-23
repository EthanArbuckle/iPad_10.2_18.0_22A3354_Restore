@implementation VKLabelExternalIconElement

- (VKLabelExternalIconElement)initWithIconElement:(const void *)a3
{
  VKLabelExternalIconElement *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VKLabelExternalIconElement;
  result = -[VKLabelExternalIconElement init](&v5, sel_init);
  if (result)
  {
    result->_element.size._e[0] = *(float *)a3;
    result->_element.size._e[1] = *((float *)a3 + 1);
    result->_element.anchorPoint._e[0] = *((float *)a3 + 2);
    result->_element.anchorPoint._e[1] = *((float *)a3 + 3);
    *(_WORD *)&result->_element.isRound = *((_WORD *)a3 + 8);
  }
  return result;
}

- (VKLabelExternalIconElement)initWithCoder:(id)a3
{
  id v4;
  VKLabelExternalIconElement *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VKLabelExternalIconElement;
  v5 = -[VKLabelExternalIconElement init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("sizeX"));
    v5->_element.size._e[0] = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("sizeY"));
    v5->_element.size._e[1] = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("anchorPointX"));
    v5->_element.anchorPoint._e[0] = v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("anchorPointY"));
    v5->_element.anchorPoint._e[1] = v9;
    v5->_element.isRound = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRound"));
    v5->_element.minZoom = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("minZoom"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  *(float *)&v5 = self->_element.size._e[0];
  v9 = v4;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("sizeX"), v5);
  *(float *)&v6 = self->_element.size._e[1];
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("sizeY"), v6);
  *(float *)&v7 = self->_element.anchorPoint._e[0];
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("anchorPointX"), v7);
  *(float *)&v8 = self->_element.anchorPoint._e[1];
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("anchorPointY"), v8);
  objc_msgSend(v9, "encodeBool:forKey:", self->_element.isRound, CFSTR("isRound"));
  objc_msgSend(v9, "encodeInt32:forKey:", self->_element.minZoom, CFSTR("minZoom"));

}

- (const)element
{
  return &self->_element;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_WORD *)self + 12) = 1;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

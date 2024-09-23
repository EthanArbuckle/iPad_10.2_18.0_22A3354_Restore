@implementation SRDefaults

- (_QWORD)initWithDictionary:(void *)a1
{
  _QWORD *v3;
  int v4;
  int v5;
  objc_super v7;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)SRDefaults;
  v3 = objc_msgSendSuper2(&v7, sel_init);
  if (v3)
  {
    v3[1] = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", 0x2516F2578), "unsignedIntegerValue");
    v3[2] = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", 0x2516F2598), "unsignedLongValue");
    v3[3] = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", 0x2516F2618), "unsignedLongValue");
    v3[4] = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", 0x2516F25B8), "unsignedLongValue");
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", 0x2516F25D8), "floatValue");
    *((_DWORD *)v3 + 10) = v4;
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", 0x2516F25F8), "floatValue");
    *((_DWORD *)v3 + 11) = v5;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->_className = 0;
  self->_exportingClassName = 0;
  v3.receiver = self;
  v3.super_class = (Class)SRDefaults;
  -[SRDefaults dealloc](&v3, sel_dealloc);
}

@end

@implementation OITSUMutableFormatObject

- (void)setFormatStruct:(id *)a3
{
  __int128 v3;
  _OWORD v4[2];
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OITSUMutableFormatObject;
  v3 = *(_OWORD *)&a3->var1.var7.var2;
  v4[0] = *(_OWORD *)&a3->var0;
  v4[1] = v3;
  v5 = *((_QWORD *)&a3->var1.var7 + 3);
  -[OITSUFormatObject p_setFormatStruct:](&v6, sel_p_setFormatStruct_, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  OITSUFormatObject *v4;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v4 = [OITSUFormatObject alloc];
  if (self)
  {
    -[OITSUFormatObject formatStruct](self, "formatStruct");
  }
  else
  {
    v8 = 0;
    v6 = 0u;
    v7 = 0u;
  }
  return -[OITSUFormatObject initWithTSUFormatFormatStruct:useExpandedContents:](v4, "initWithTSUFormatFormatStruct:useExpandedContents:", &v6, -[OITSUFormatObject useExpandedContents](self, "useExpandedContents", v6, v7, v8));
}

@end

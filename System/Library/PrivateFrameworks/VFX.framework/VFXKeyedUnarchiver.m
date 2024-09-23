@implementation VFXKeyedUnarchiver

- (id)initForReadingWithData:(id)a3 secure:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;
  void *v21;

  v4 = a4;
  v20.receiver = self;
  v20.super_class = (Class)VFXKeyedUnarchiver;
  v21 = 0;
  v5 = -[VFXKeyedUnarchiver initForReadingFromData:error:](&v20, sel_initForReadingFromData_error_, a3, &v21);
  v9 = v5;
  if (v5)
  {
    objc_msgSend_setDecodingFailurePolicy_(v5, v6, 0, v8);
    objc_msgSend_setRequiresSecureCoding_(v9, v10, v4, v11);
  }
  if (v21)
  {
    v12 = objc_msgSend_localizedDescription(v21, v6, v7, v8);
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: Failed to instantiate unarchiver with error %@"), v13, v14, v15, v16, v17, v18, v12);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXKeyedUnarchiver;
  -[VFXKeyedUnarchiver dealloc](&v3, sel_dealloc);
}

- (NSURL)documentEnclosingURL
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_documentURL(self, a2, v2, v3);
  return (NSURL *)objc_msgSend_URLByDeletingLastPathComponent(v4, v5, v6, v7);
}

- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4
{
  const char *v7;
  uint64_t v8;
  float32x2_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  objc_super v22;
  uint64_t v23;

  if (!strcmp(a3, "{CATransform3D=dddddddddddddddd}"))
  {
    v23 = 0;
    v9 = (float32x2_t *)objc_msgSend_decodeBytesWithReturnedLength_(self, v7, (uint64_t)&v23, v8);
    if (v23 == 64)
    {
      sub_1B18DFCCC(v9, (float64x2_t *)a4);
    }
    else
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: decodeValueOfObjCType - failed to decode CATransform3D"), v10, v11, v12, v13, v14, v15, v21);
      v16 = (_OWORD *)MEMORY[0x1E0CD2610];
      v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      *((_OWORD *)a4 + 4) = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      *((_OWORD *)a4 + 5) = v17;
      v18 = v16[7];
      *((_OWORD *)a4 + 6) = v16[6];
      *((_OWORD *)a4 + 7) = v18;
      v19 = v16[1];
      *(_OWORD *)a4 = *v16;
      *((_OWORD *)a4 + 1) = v19;
      v20 = v16[3];
      *((_OWORD *)a4 + 2) = v16[2];
      *((_OWORD *)a4 + 3) = v20;
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)VFXKeyedUnarchiver;
    -[VFXKeyedUnarchiver decodeValueOfObjCType:at:](&v22, sel_decodeValueOfObjCType_at_, a3, a4);
  }
}

- (NSURL)documentURL
{
  return self->_documentURL;
}

- (void)setDocumentURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSString)lookUpKey
{
  return self->_lookUpKey;
}

- (void)setLookUpKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (id)lookUpFoundInstance
{
  return self->_lookUpFoundInstance;
}

- (void)setLookUpFoundInstance:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (NSArray)allTargetsFromAnimCodec
{
  return self->_allTargetsFromAnimCodec;
}

- (void)setAllTargetsFromAnimCodec:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

@end

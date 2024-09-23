@implementation OCFontMetadata

- (OCFontMetadata)initWithSig:(id)a3 charSet:(int)a4 panose1:(id)a5 pitch:(int)a6 genericFamily:(int)a7 altNames:(id)a8
{
  id v15;
  id v16;
  id v17;
  OCFontMetadata *v18;
  OCFontMetadata *v19;
  uint64_t v20;
  NSArray *altNames;
  objc_super v23;

  v15 = a3;
  v16 = a5;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)OCFontMetadata;
  v18 = -[OCFontMetadata init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sig, a3);
    v19->_charSet = a4;
    objc_storeStrong((id *)&v19->_panose1, a5);
    v19->_pitch = a6;
    v19->_genericFamily = a7;
    v20 = objc_msgSend(v17, "copy");
    altNames = v19->_altNames;
    v19->_altNames = (NSArray *)v20;

  }
  return v19;
}

+ (id)fontMetadataWithSig:(id)a3 charSet:(int)a4 panose1:(id)a5 pitch:(int)a6 genericFamily:(int)a7 altNames:(id)a8
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  OCFontMetadata *v16;

  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a4;
  v13 = a3;
  v14 = a5;
  v15 = a8;
  v16 = -[OCFontMetadata initWithSig:charSet:panose1:pitch:genericFamily:altNames:]([OCFontMetadata alloc], "initWithSig:charSet:panose1:pitch:genericFamily:altNames:", v13, v12, v14, v10, v9, v15);

  return v16;
}

- (OCFontSig)sig
{
  return self->_sig;
}

- (int)charSet
{
  return self->_charSet;
}

- (OCFontPanose1)panose1
{
  return self->_panose1;
}

- (int)pitch
{
  return self->_pitch;
}

- (int)genericFamily
{
  return self->_genericFamily;
}

- (NSArray)altNames
{
  return self->_altNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altNames, 0);
  objc_storeStrong((id *)&self->_panose1, 0);
  objc_storeStrong((id *)&self->_sig, 0);
}

@end

@implementation colOffsetMap

- (colOffsetMap)initWithCtx:(id)a3
{
  id v4;
  colOffsetMap *v5;
  uint64_t v6;
  NSArray *statusOffsets;
  uint64_t v8;
  NSArray *lengthOffsets;
  uint64_t v10;
  NSArray *v11;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  NSArray *valueOffsets;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)colOffsetMap;
  v5 = -[colOffsetMap init](&v17, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "serverSupports64BitOffsets"))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", &unk_24F068DD0, &unk_24F068DE8, &unk_24F068E00, &unk_24F068E18, &unk_24F068E30, &unk_24F068E48, &unk_24F068E60, &unk_24F068E78, &unk_24F068E90, &unk_24F068EA8, &unk_24F068EC0, &unk_24F068ED8, &unk_24F068EF0, &unk_24F068F08, &unk_24F068F20, &unk_24F068F38, &unk_24F068F50,
        &unk_24F068F68,
        &unk_24F068F80,
        &unk_24F068F98,
        &unk_24F068FB0,
        &unk_24F068FC8,
        &unk_24F068FE0,
        &unk_24F068FF8,
        0);
      v6 = objc_claimAutoreleasedReturnValue();
      statusOffsets = v5->_statusOffsets;
      v5->_statusOffsets = (NSArray *)v6;

      if (!v5->_statusOffsets)
        goto LABEL_10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", &unk_24F069010, &unk_24F069028, &unk_24F069040, &unk_24F069058, &unk_24F069070, &unk_24F069088, &unk_24F0690A0, &unk_24F0690B8, &unk_24F0690D0, &unk_24F0690E8, &unk_24F069100, &unk_24F069118, &unk_24F069130, &unk_24F069148, &unk_24F069160, &unk_24F069178, &unk_24F069190,
        &unk_24F0691A8,
        &unk_24F0691C0,
        &unk_24F0691D8,
        &unk_24F0691F0,
        &unk_24F069208,
        &unk_24F069220,
        &unk_24F069238,
        0);
      v8 = objc_claimAutoreleasedReturnValue();
      lengthOffsets = v5->_lengthOffsets;
      v5->_lengthOffsets = (NSArray *)v8;

      if (!v5->_lengthOffsets)
        goto LABEL_10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", &unk_24F069250, &unk_24F069268, &unk_24F069280, &unk_24F069298, &unk_24F0692B0, &unk_24F0692C8, &unk_24F0692E0, &unk_24F0692F8, &unk_24F069310, &unk_24F069328, &unk_24F069340, &unk_24F069358, &unk_24F069370, &unk_24F069388, &unk_24F0693A0, &unk_24F0693B8, &unk_24F0693D0,
        &unk_24F0693E8,
        &unk_24F069400,
        &unk_24F069418,
        &unk_24F069430,
        &unk_24F069448,
        &unk_24F069460,
        &unk_24F069478,
        0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", &unk_24F068DD0, &unk_24F068DE8, &unk_24F069490, &unk_24F0694A8, &unk_24F0694C0, &unk_24F0694D8, &unk_24F069070, &unk_24F0694F0, &unk_24F069508, &unk_24F069520, &unk_24F069538, &unk_24F069550, &unk_24F069568, &unk_24F069580, &unk_24F069598, &unk_24F0695B0, &unk_24F0695C8,
        &unk_24F0695E0,
        &unk_24F069148,
        &unk_24F0695F8,
        &unk_24F069610,
        &unk_24F069628,
        &unk_24F069640,
        &unk_24F069658,
        0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v5->_statusOffsets;
      v5->_statusOffsets = (NSArray *)v10;

      if (!v5->_statusOffsets)
        goto LABEL_10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", &unk_24F069010, &unk_24F069670, &unk_24F069280, &unk_24F069688, &unk_24F0696A0, &unk_24F0696B8, &unk_24F069088, &unk_24F0696D0, &unk_24F0696E8, &unk_24F0692F8, &unk_24F0690B8, &unk_24F0690D0, &unk_24F069700, &unk_24F069718, &unk_24F069730, &unk_24F069748, &unk_24F069760,
        &unk_24F069130,
        &unk_24F069778,
        &unk_24F069790,
        &unk_24F068F20,
        &unk_24F0697A8,
        &unk_24F0697C0,
        &unk_24F0697D8,
        0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v5->_lengthOffsets;
      v5->_lengthOffsets = (NSArray *)v12;

      if (!v5->_lengthOffsets)
        goto LABEL_10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", &unk_24F069250, &unk_24F0697F0, &unk_24F069808, &unk_24F069820, &unk_24F069040, &unk_24F069838, &unk_24F069850, &unk_24F0692C8, &unk_24F0692E0, &unk_24F069868, &unk_24F069880, &unk_24F069310, &unk_24F069898, &unk_24F0698B0, &unk_24F069340, &unk_24F069100, &unk_24F0698C8,
        &unk_24F0698E0,
        &unk_24F069388,
        &unk_24F0693A0,
        &unk_24F0698F8,
        &unk_24F069910,
        &unk_24F069178,
        &unk_24F069928,
        0);
    }
    v14 = objc_claimAutoreleasedReturnValue();
    valueOffsets = v5->_valueOffsets;
    v5->_valueOffsets = (NSArray *)v14;

    if (!v5->_valueOffsets)
    {
LABEL_10:

      v5 = 0;
    }
  }

  return v5;
}

- (NSArray)statusOffsets
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStatusOffsets:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)lengthOffsets
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLengthOffsets:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)valueOffsets
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setValueOffsets:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueOffsets, 0);
  objc_storeStrong((id *)&self->_lengthOffsets, 0);
  objc_storeStrong((id *)&self->_statusOffsets, 0);
}

@end

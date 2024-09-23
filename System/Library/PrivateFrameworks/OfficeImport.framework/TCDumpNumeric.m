@implementation TCDumpNumeric

- (TCDumpNumeric)initWithType:(int)a3 enumType:(id)a4
{
  id v7;
  TCDumpNumeric *v8;
  TCDumpNumeric *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TCDumpNumeric;
  v8 = -[TCDumpType init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->mType = a3;
    objc_storeStrong((id *)&v8->mEnumType, a4);
  }

  return v9;
}

- (TCDumpNumeric)initWithType:(int)a3
{
  return -[TCDumpNumeric initWithType:enumType:](self, "initWithType:enumType:", *(_QWORD *)&a3, 0);
}

- (int)type
{
  return self->mType;
}

- (id)enumType
{
  return self->mEnumType;
}

- (void)fromBinary:(__sFILE *)a3 toXml:(_xmlNode *)a4 state:(id)a5
{
  uint64_t UI8;
  int v9;
  int v10;
  int v11;
  int v12;
  __int16 v13;
  double v14;
  int v15;
  unsigned int LEUI32;
  id v17;

  v17 = a5;
  switch(self->mType)
  {
    case 1:
      UI8 = TCDumpReadUI8(a3);
      v9 = 0;
      v10 = 1;
      goto LABEL_10;
    case 2:
      UI8 = (char)TCDumpReadUI8(a3);
      v10 = 1;
      v9 = 1;
      goto LABEL_10;
    case 3:
      v11 = TCDumpReadUI8(a3);
      v12 = TCDumpReadUI8(a3);
      v9 = 0;
      UI8 = v11 | (v12 << 8);
      goto LABEL_6;
    case 4:
      v13 = TCDumpReadUI8(a3);
      UI8 = (__int16)(v13 | ((unsigned __int16)TCDumpReadUI8(a3) << 8));
      v9 = 1;
LABEL_6:
      v10 = 2;
      goto LABEL_10;
    case 5:
      UI8 = TCDumpReadLEUI32(a3);
      v9 = 0;
      goto LABEL_9;
    case 6:
      UI8 = TCDumpReadLEUI32(a3);
      v9 = 1;
LABEL_9:
      v10 = 4;
LABEL_10:
      writeIntToXml(a4, UI8, v10, v9, self->mEnumType, v17);
      break;
    case 7:
      v14 = COERCE_FLOAT(TCDumpReadLEUI32(a3));
      v15 = 4;
      goto LABEL_13;
    case 8:
      LEUI32 = TCDumpReadLEUI32(a3);
      *(_QWORD *)&v14 = LEUI32 | (unint64_t)(TCDumpReadLEUI32(a3) << 32);
      v15 = 8;
LABEL_13:
      writeRealToXml(a4, v15, v14);
      break;
    default:
      break;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEnumType, 0);
}

@end

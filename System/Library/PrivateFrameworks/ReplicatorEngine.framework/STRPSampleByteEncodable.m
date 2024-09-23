@implementation STRPSampleByteEncodable

- (STRPSampleByteEncodable)initWithStruct:(MyCoolStruct *)a3
{
  uint64_t v3;
  uint64_t v4;
  STRPSampleByteEncodable *result;
  objc_super v7;

  v4 = v3;
  v7.receiver = self;
  v7.super_class = (Class)STRPSampleByteEncodable;
  result = -[STRPSampleByteEncodable init](&v7, sel_init);
  if (result)
  {
    *(_QWORD *)&result->_aStruct.aBool = a3;
    *(_DWORD *)&result->_aStruct.someOptions = v4;
    *((_WORD *)&result->_aStruct.someOptions + 2) = WORD2(v4);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  STRPSampleByteEncodable *v4;
  STRPSampleByteEncodable *v5;
  int v6;
  int v7;
  __int16 v8;
  int v9;
  __int16 v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v14;
  __int128 v15;
  __int128 v16;

  v4 = (STRPSampleByteEncodable *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = (int)-[STRPSampleByteEncodable aStruct](self, "aStruct");
      if (((-[STRPSampleByteEncodable aStruct](v5, "aStruct") ^ v6) & 1) != 0
        || (*(_QWORD *)&v16 = -[STRPSampleByteEncodable aStruct](self, "aStruct"),
            DWORD2(v16) = v7,
            WORD6(v16) = v8,
            *(_QWORD *)&v15 = -[STRPSampleByteEncodable aStruct](v5, "aStruct"),
            DWORD2(v15) = v9,
            WORD6(v15) = v10,
            *(_QWORD *)((char *)&v16 + 6) != *(_QWORD *)((char *)&v15 + 6))
        || (v11 = -[STRPSampleByteEncodable aStruct](self, "aStruct"),
            (((unint64_t)-[STRPSampleByteEncodable aStruct](v5, "aStruct") ^ v11) & 0xFF0000000000) != 0))
      {
        v12 = 0;
      }
      else
      {
        v14 = (unint64_t)-[STRPSampleByteEncodable aStruct](self, "aStruct") >> 8;
        v12 = (_DWORD)v14 == ((unint64_t)-[STRPSampleByteEncodable aStruct](v5, "aStruct") >> 8);
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBytes:length:forKey:", &self->_aStruct, 14, CFSTR("aStruct"));
}

- (STRPSampleByteEncodable)initWithCoder:(id)a3
{
  uint64_t v4;
  STRPSampleByteEncodable *v5;
  uint64_t v7;

  v7 = 0;
  v4 = objc_msgSend(objc_retainAutorelease(a3), "decodeBytesForKey:returnedLength:", CFSTR("aStruct"), &v7);
  if (v7 == 14)
  {
    self = -[STRPSampleByteEncodable initWithStruct:](self, "initWithStruct:", *(_QWORD *)v4, *(unsigned int *)(v4 + 8) | ((unint64_t)*(unsigned __int16 *)(v4 + 12) << 32));
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (MyCoolStruct)aStruct
{
  return *(MyCoolStruct **)&self->_aStruct.aBool;
}

@end

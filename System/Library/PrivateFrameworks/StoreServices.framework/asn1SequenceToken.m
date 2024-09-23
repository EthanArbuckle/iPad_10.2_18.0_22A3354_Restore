@implementation asn1SequenceToken

- (id)_initWithID:(unint64_t)a3 class:(unsigned __int8)a4 length:(unint64_t)a5 content:(const char *)a6 opaque:(BOOL)a7
{
  int v9;
  id result;
  id v12;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)asn1SequenceToken;
  result = -[asn1SequenceToken init](&v13, sel_init, a3, a4, a5, a6, a7);
  if (a3 != 16 || v9)
  {
    v12 = result;
    return 0;
  }
  else if (result)
  {
    *((_BYTE *)result + 8) = 0;
    *((_QWORD *)result + 2) = 16;
    *((_QWORD *)result + 3) = a5;
    *((_QWORD *)result + 4) = a6;
    *((_QWORD *)result + 5) = a6;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SEQUENCE Token. (length:%ld)"), self->super.mLength);
}

- (void)reset
{
  self->mReadPointer = -[asn1Token content](self, "content");
}

- (id)nextToken
{
  const char *mReadPointer;
  const char *v4;
  id v5;

  mReadPointer = self->mReadPointer;
  v4 = -[asn1Token content](self, "content");
  if (mReadPointer >= &v4[-[asn1Token length](self, "length")])
    return 0;
  v5 = +[asn1Token readTokenFromBuffer:](asn1Token, "readTokenFromBuffer:", self->mReadPointer);
  self->mReadPointer = (const char *)objc_msgSend(v5, "content");
  self->mReadPointer += objc_msgSend(v5, "length");
  return v5;
}

@end

@implementation _CRLPKStrokeIDWrapper

- (_CRLPKStrokeIDWrapper)initWithStrokeID:(_CRLPKStrokeID *)a3
{
  _CRLPKStrokeIDWrapper *result;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_CRLPKStrokeIDWrapper;
  result = -[_CRLPKStrokeIDWrapper init](&v6, "init");
  v5 = *(_QWORD *)&a3->replicaUUID[12];
  *(_OWORD *)&result->_strokeID.clock = *(_OWORD *)&a3->clock;
  *(_QWORD *)&result->_strokeID.replicaUUID[12] = v5;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned __int8 v13[16];
  int v14;

  v4 = a3;
  -[_CRLPKStrokeIDWrapper strokeID](self, "strokeID");
  if (v4)
  {
    objc_msgSend(v4, "strokeID");
    v5 = v8;
  }
  else
  {
    v5 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
  }
  v6 = v12 == v5 && !sub_1003A72E8(v13, (const unsigned __int8 *)&v9) && v14 == HIDWORD(v11);

  return v6;
}

- (unint64_t)hash
{
  return *(_QWORD *)self->_strokeID.replicaUUID;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _CRLPKStrokeIDWrapper *v4;
  uint64_t v6;

  v4 = +[_CRLPKStrokeIDWrapper allocWithZone:](_CRLPKStrokeIDWrapper, "allocWithZone:", a3);
  -[_CRLPKStrokeIDWrapper strokeID](self, "strokeID");
  return -[_CRLPKStrokeIDWrapper initWithStrokeID:](v4, "initWithStrokeID:", &v6);
}

- (_CRLPKStrokeID)strokeID
{
  *retstr = *(_CRLPKStrokeID *)&self->replicaUUID[4];
  return self;
}

- (void)setStrokeID:(_CRLPKStrokeID *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->clock;
  *(_QWORD *)&self->_strokeID.replicaUUID[12] = *(_QWORD *)&a3->replicaUUID[12];
  *(_OWORD *)&self->_strokeID.clock = v3;
}

@end

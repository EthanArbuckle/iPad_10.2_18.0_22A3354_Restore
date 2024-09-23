@implementation OUKeyframeMeta

- (OUKeyframeMeta)init
{
  OUKeyframeMeta *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OUKeyframeMeta;
  result = -[OUKeyframeMeta init](&v3, sel_init);
  if (result)
  {
    result->_size = 0;
    result->_timestamp = 0.0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v4 = objc_opt_new();
  objc_storeStrong((id *)(v4 + 8), self->_identifier);
  v5 = *(_OWORD *)&self[1].super.isa;
  v6 = *(_OWORD *)&self[1]._size;
  v7 = *(_OWORD *)&self[2]._size;
  *(_OWORD *)(v4 + 64) = *(_OWORD *)&self[2].super.isa;
  *(_OWORD *)(v4 + 80) = v7;
  *(_OWORD *)(v4 + 32) = v5;
  *(_OWORD *)(v4 + 48) = v6;
  *(_QWORD *)(v4 + 16) = self->_size;
  *(double *)(v4 + 24) = self->_timestamp;
  return (id)v4;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (__n128)cameraPose
{
  return a1[2];
}

- (__n128)setCameraPose:(__n128)a3
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  return result;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

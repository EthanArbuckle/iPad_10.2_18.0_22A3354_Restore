@implementation _TUIRenderModelIdentifierInterest

- (_TUIRenderModelIdentifierInterest)initWithIndexes:(void *)a3 map:(id)a4
{
  id v7;
  id v8;
  _TUIRenderModelIdentifierInterest *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_TUIRenderModelIdentifierInterest;
  v8 = -[_TUIRenderModelIdentifierInterest init](&v11, "init");
  v9 = (_TUIRenderModelIdentifierInterest *)v8;
  if (v8)
  {
    sub_15BA80((uint64_t *)v8 + 1, (uint64_t)a3);
    objc_storeStrong((id *)&v9->_map, a4);
    -[_TUIRenderModelIdentifierMap _retainIndexes:](v9->_map, "_retainIndexes:", &v9->_indexes);
  }

  return v9;
}

- (void)invalidate
{
  -[_TUIRenderModelIdentifierMap _releaseIndexes:](self->_map, "_releaseIndexes:", &self->_indexes);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
  sub_997B8((uint64_t)&self->_indexes, (_QWORD *)self->_indexes.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  return self;
}

@end

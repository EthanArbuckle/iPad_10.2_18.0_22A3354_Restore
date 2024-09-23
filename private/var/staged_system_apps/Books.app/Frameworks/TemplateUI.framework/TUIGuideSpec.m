@implementation TUIGuideSpec

- (id)_initWithKind:(unint64_t)a3 index:(int64_t)a4 edge:(unint64_t)a5
{
  id result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUIGuideSpec;
  result = -[TUIGuideSpec init](&v9, "init");
  if (result)
  {
    *((_QWORD *)result + 1) = a3;
    *((_QWORD *)result + 2) = a4;
    *((_QWORD *)result + 3) = a5;
  }
  return result;
}

- (TUIGuideSpec)initWithOther:(id)a3
{
  id v4;
  TUIGuideSpec *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TUIGuideSpec;
  v5 = -[TUIGuideSpec init](&v7, "init");
  if (v5)
  {
    v5->_kind = (unint64_t)objc_msgSend(v4, "kind");
    v5->_index = (int64_t)objc_msgSend(v4, "index");
    v5->_edge = (unint64_t)objc_msgSend(v4, "edge");
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithOther:", self);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id kind;
  id edge;
  id index;
  BOOL v9;

  v4 = a3;
  v5 = objc_opt_class(TUIGuideSpec);
  v9 = (objc_opt_isKindOfClass(v4, v5) & 1) != 0
    && (kind = (id)self->_kind, kind == objc_msgSend(v4, "kind"))
    && (edge = (id)self->_edge, edge == objc_msgSend(v4, "edge"))
    && (index = (id)self->_index, index == objc_msgSend(v4, "index"))
    && self->_kind != 1;

  return v9;
}

- (unint64_t)hash
{
  return (16 * self->_edge) | (self->_index << 8) | self->_kind;
}

+ (id)gridWithEdge:(unint64_t)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "_initWithKind:index:edge:", 2, 0x7FFFFFFFFFFFFFFFLL, a3);
}

+ (id)contentWithEdge:(unint64_t)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "_initWithKind:index:edge:", 3, 0x7FFFFFFFFFFFFFFFLL, a3);
}

+ (id)columnWithIndex:(int64_t)a3 edge:(unint64_t)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "_initWithKind:index:edge:", 4, a3, a4);
}

+ (id)unbound
{
  return objc_msgSend(objc_alloc((Class)a1), "_initWithKind:index:edge:", 1, 0x7FFFFFFFFFFFFFFFLL, 0);
}

+ (id)named:(int64_t)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "_initWithKind:index:edge:", 5, a3, 0);
}

- (id)description
{
  unint64_t edge;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  objc_class *v12;
  NSString *v13;
  objc_class *v14;
  NSString *v15;
  objc_class *v16;
  NSString *v17;
  objc_class *v18;
  NSString *v19;
  uint64_t v21;
  uint64_t v22;

  edge = self->_edge;
  if (edge > 3)
    v4 = 0;
  else
    v4 = (uint64_t)*(&off_240FB8 + edge);
  switch(self->_kind)
  {
    case 0uLL:
      v5 = (objc_class *)objc_opt_class(self);
      v6 = NSStringFromClass(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ unknown>"), v7, v21, v22);
      goto LABEL_12;
    case 1uLL:
      v10 = (objc_class *)objc_opt_class(self);
      v11 = NSStringFromClass(v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ unbound>"), v7, v21, v22);
      goto LABEL_12;
    case 2uLL:
      v12 = (objc_class *)objc_opt_class(self);
      v13 = NSStringFromClass(v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ grid %@>"), v7, v4, v22);
      goto LABEL_12;
    case 3uLL:
      v14 = (objc_class *)objc_opt_class(self);
      v15 = NSStringFromClass(v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ content %@>"), v7, v4, v22);
      goto LABEL_12;
    case 4uLL:
      v16 = (objc_class *)objc_opt_class(self);
      v17 = NSStringFromClass(v16);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ column=%ld %@>"), v7, self->_index, v4);
      goto LABEL_12;
    case 5uLL:
      v18 = (objc_class *)objc_opt_class(self);
      v19 = NSStringFromClass(v18);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ named %ld>"), v7, self->_index, v22);
LABEL_12:
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

      break;
    default:
      v9 = 0;
      break;
  }
  return v9;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (int64_t)index
{
  return self->_index;
}

- (unint64_t)edge
{
  return self->_edge;
}

@end

@implementation _BKMouseEventGlobalRoute

- (unint64_t)hash
{
  return -[BKCAContextDestination hash](self->_destination, "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  char v10;

  v5 = objc_opt_class(_BKMouseEventGlobalRoute, a2, a3);
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (v9)
    v10 = BSEqualObjects(v9[3], self->_destination);
  else
    v10 = 0;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end

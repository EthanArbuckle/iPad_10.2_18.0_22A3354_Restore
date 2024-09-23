@implementation BKHitTestResultKey

- (unint64_t)hash
{
  return -[BKCAContextDestination hash](self->_destination, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  BOOL v10;

  v5 = objc_opt_class(BKHitTestResultKey, a2, a3);
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

  v10 = v7 && BSEqualObjects(self->_destination, v9[2]) && self->_userIdentifier == *((_DWORD *)v9 + 2);
  return v10;
}

@end

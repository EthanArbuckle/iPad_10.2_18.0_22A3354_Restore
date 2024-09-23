@implementation UITabSidebarScrollTarget

+ (id)targetForHeader
{
  _BYTE *v2;

  v2 = (_BYTE *)objc_opt_new();
  v2[8] = 1;
  return v2;
}

+ (id)targetForFooter
{
  _BYTE *v2;

  v2 = (_BYTE *)objc_opt_new();
  v2[8] = 0;
  return v2;
}

+ (id)targetForTab:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  v5 = (void *)v4[2];
  v4[2] = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tab, 0);
}

@end

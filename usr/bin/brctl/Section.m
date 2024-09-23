@implementation Section

- (Section)initWithUUID:(id)a3 kind:(int)a4 depth:(int)a5 parent:(id)a6
{
  id v10;
  Section *v11;
  Section *v12;
  _DWORD *v13;
  uint64_t v14;
  objc_super v16;

  v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)Section;
  v11 = -[Section init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_parent, a6);
    v12->_kind = a4;
    v12->_depth = a5;
    if (a4 == 4 || !v10)
    {
      v14 = ((_BYTE)dword_10002A8F8 + 1) & 7;
      dword_10002A8F8 = ((_BYTE)dword_10002A8F8 + 1) & 7;
      v12->_color = dword_10001B5A0[v14];
    }
    else
    {
      v13 = (_DWORD *)objc_claimAutoreleasedReturnValue(-[Section sectionRoot](v12, "sectionRoot"));
      v12->_color = v13[2];

    }
  }

  return v12;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d parent: %@"), self->_kind, self->_parent);
}

- (id)sectionRoot
{
  Section *v2;
  Section *parent;
  Section *v4;

  v2 = self;
  parent = v2->_parent;
  if (parent)
  {
    while (v2->_kind != 4)
    {
      v4 = parent;

      parent = v4->_parent;
      v2 = v4;
      if (!parent)
        return v4;
    }
  }
  v4 = v2;
  return v4;
}

- (void)_dumpPrefix:(const char *)a3 depth:(int)a4 to:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  if (a4 >= 1)
  {
    v9 = v8;
    if (self->_kind != 4)
    {
      -[Section _dumpPrefix:depth:to:](self->_parent, "_dumpPrefix:depth:to:", a3, (a4 - 1), v8);
      v8 = v9;
    }
    objc_msgSend(v8, "startFgColor:attr:", self->_color, 2);
    objc_msgSend(v9, "puts:len:", a3, strlen(a3));
    objc_msgSend(v9, "reset");
    v8 = v9;
  }

}

- (void)dumpPrefixWithKind:(int)a3 depth:(int)a4 to:(id)a5
{
  id v8;
  const char *v9;
  const char *v10;
  const char *v11;
  id v12;

  v8 = a5;
  v9 = " o ";
  v10 = "[ ";
  v11 = "┃  ";
  v12 = v8;
  switch(a3)
  {
    case 0:
      v9 = "┃  ";
      goto LABEL_4;
    case 2:
      v9 = "┏  ";
      goto LABEL_4;
    case 4:
      goto LABEL_8;
    case 5:
LABEL_4:
      if (a3 == 5)
        v11 = v9;
      if (self->_kind != 4)
      {
        v10 = v9;
LABEL_8:
        -[Section _dumpPrefix:depth:to:](self->_parent, "_dumpPrefix:depth:to:", v11, (a4 - 1), v8);
        v8 = v12;
        v9 = v10;
      }
      objc_msgSend(v8, "startFgColor:attr:", self->_color, 2);
      objc_msgSend(v12, "puts:len:", v9, strlen(v9));
      objc_msgSend(v12, "reset");

      return;
    default:
      sub_100016FB0();
  }
}

- (void)dumpEndSectionTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_kind != 4)
  {
    -[Section _dumpPrefix:depth:to:](self->_parent, "_dumpPrefix:depth:to:", "┃  ", (self->_depth - 1), v4);
    v4 = v5;
  }
  objc_msgSend(v4, "startFgColor:attr:", self->_color, 2);
  objc_msgSend(v5, "write:", "%send\n", "┗  ");
  objc_msgSend(v5, "reset");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
}

@end

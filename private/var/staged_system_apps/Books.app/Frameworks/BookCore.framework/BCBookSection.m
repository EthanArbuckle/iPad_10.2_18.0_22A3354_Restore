@implementation BCBookSection

+ (BCBookSection)bookSectionWithStartPosition:(id)a3 endPosition:(id)a4
{
  id v5;
  id v6;
  BCBookSection *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(BCBookSection);
  -[BCBookSection setStartPosition:](v7, "setStartPosition:", v6);

  -[BCBookSection setEndPosition:](v7, "setEndPosition:", v5);
  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  void *v7;
  id v8;
  int64_t v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookSection startPosition](self, "startPosition"));
  v6 = (char *)objc_msgSend(v5, "compare:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookSection endPosition](self, "endPosition"));
  v8 = objc_msgSend(v7, "compare:", v4);

  if (v8 == (id)-1)
    v9 = -1;
  else
    v9 = 0;
  if (v6 == (_BYTE *)&dword_0 + 1)
    return 1;
  else
    return v9;
}

- (int64_t)compareWithSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookSection startPosition](self, "startPosition"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startPosition"));

  v7 = objc_msgSend(v5, "compare:", v6);
  return (int64_t)v7;
}

- (BOOL)contains:(id)a3
{
  return a3 && -[BCBookSection compare:](self, "compare:") == 0;
}

- (BOOL)intersects:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  void *v9;
  char *v10;

  if (!a3)
    return 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookSection startPosition](self, "startPosition"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endPosition"));
  v7 = (char *)objc_msgSend(v5, "compare:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookSection endPosition](self, "endPosition"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startPosition"));

  v10 = (char *)objc_msgSend(v8, "compare:", v9);
  return v7 != (_BYTE *)&dword_0 + 1 && v10 + 1 != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", CFSTR("BCBookSection\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookSection startPosition](self, "startPosition"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        startPosition . . . . : %@\n"), v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCBookSection endPosition](self, "endPosition"));
  objc_msgSend(v3, "appendFormat:", CFSTR("        endPosition . . . . . : %@"), v5);

  return v3;
}

- (BCBookPosition)startPosition
{
  return self->_startPosition;
}

- (void)setStartPosition:(id)a3
{
  objc_storeStrong((id *)&self->_startPosition, a3);
}

- (BCBookPosition)endPosition
{
  return self->_endPosition;
}

- (void)setEndPosition:(id)a3
{
  objc_storeStrong((id *)&self->_endPosition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endPosition, 0);
  objc_storeStrong((id *)&self->_startPosition, 0);
}

@end

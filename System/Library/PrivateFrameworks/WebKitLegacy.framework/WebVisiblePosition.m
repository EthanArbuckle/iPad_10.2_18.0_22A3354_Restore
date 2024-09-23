@implementation WebVisiblePosition

+ (id)_wrapVisiblePosition:(VisiblePosition *)a3
{
  WebVisiblePosition *v4;
  uint64_t v5;
  Node *var0;

  v4 = objc_alloc_init(WebVisiblePosition);
  v5 = operator new();
  var0 = a3->var0.var0.var0;
  if (a3->var0.var0.var0)
    *((_DWORD *)var0 + 6) += 2;
  *(_QWORD *)v5 = var0;
  *(_DWORD *)(v5 + 8) = a3->var0.var1;
  *(_BYTE *)(v5 + 12) = *((_BYTE *)&a3->var0 + 12);
  *(_BYTE *)(v5 + 16) = a3->var1;
  v4->_internal = (WebObjectInternal *)v5;
  return (id)(id)CFMakeCollectable(v4);
}

+ (id)_wrapVisiblePositionIfValid:(VisiblePosition *)a3
{
  Node *var0;
  uint64_t (*v4)();
  id v5;
  WebCore::Node *v6;
  WebCore::Node *v8;
  unsigned int var1;
  char v10;
  BOOL v11;

  var0 = a3->var0.var0.var0;
  v4 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
  if (!a3->var0.var0.var0)
    v4 = 0;
  if (!v4)
    return 0;
  if (var0)
    *((_DWORD *)var0 + 6) += 2;
  v8 = (WebCore::Node *)var0;
  var1 = a3->var0.var1;
  v10 = *((_BYTE *)&a3->var0 + 12);
  v11 = a3->var1;
  v5 = +[WebVisiblePosition _wrapVisiblePosition:](WebVisiblePosition, "_wrapVisiblePosition:", &v8);
  v6 = v8;
  v8 = 0;
  if (!v6)
    return v5;
  if (*((_DWORD *)v6 + 6) != 2)
  {
    *((_DWORD *)v6 + 6) -= 2;
    return v5;
  }
  if ((*((_WORD *)v6 + 15) & 0x400) != 0)
    return v5;
  WebCore::Node::removedLastRef(v6);
  return v5;
}

- (VisiblePosition)_visiblePosition
{
  uint64_t *v3;
  uint64_t v4;

  v3 = *(uint64_t **)&self->var0.var1;
  v4 = *v3;
  if (*v3)
    *(_DWORD *)(v4 + 24) += 2;
  retstr->var0.var0.var0 = (Node *)v4;
  retstr->var0.var1 = *((_DWORD *)v3 + 2);
  *((_BYTE *)&retstr->var0 + 12) = *((_BYTE *)v3 + 12);
  retstr->var1 = *((_BYTE *)v3 + 16);
  return self;
}

- (void)dealloc
{
  WebObjectInternal *internal;
  uint64_t v4;
  objc_super v5;

  internal = self->_internal;
  if (internal)
  {
    v4 = *(_QWORD *)internal;
    *(_QWORD *)internal = 0;
    if (v4)
    {
      if (*(_DWORD *)(v4 + 24) == 2)
      {
        if ((*(_WORD *)(v4 + 30) & 0x400) == 0)
          WebCore::Node::removedLastRef((WebCore::Node *)v4);
      }
      else
      {
        *(_DWORD *)(v4 + 24) -= 2;
      }
    }
    MEMORY[0x1D82A8D20](internal, 0x1020C4021B6F8B6);
  }
  self->_internal = 0;
  v5.receiver = self;
  v5.super_class = (Class)WebVisiblePosition;
  -[WebVisiblePosition dealloc](&v5, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  BOOL v5;
  WebCore::Node *v7;
  WebCore::Node *v8;
  WebCore::Node *v9[3];
  WebCore::Node *v10[3];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (!self)
  {
    memset(v10, 0, sizeof(v10));
    if (a3)
      goto LABEL_4;
LABEL_8:
    memset(v9, 0, sizeof(v9));
    goto LABEL_9;
  }
  -[WebVisiblePosition _visiblePosition](self, "_visiblePosition");
  if (!a3)
    goto LABEL_8;
LABEL_4:
  objc_msgSend(a3, "_visiblePosition");
LABEL_9:
  v5 = WebCore::operator==((uint64_t)v10, (uint64_t)v9);
  v7 = v9[0];
  v9[0] = 0;
  if (v7)
  {
    if (*((_DWORD *)v7 + 6) == 2)
    {
      if ((*((_WORD *)v7 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v7);
    }
    else
    {
      *((_DWORD *)v7 + 6) -= 2;
    }
  }
  v8 = v10[0];
  v10[0] = 0;
  if (!v8)
    return v5;
  if (*((_DWORD *)v8 + 6) != 2)
  {
    *((_DWORD *)v8 + 6) -= 2;
    return v5;
  }
  if ((*((_WORD *)v8 + 15) & 0x400) != 0)
    return v5;
  WebCore::Node::removedLastRef(v8);
  return v5;
}

- (int64_t)compare:(id)a3
{
  const VisiblePosition *v4;
  int64_t v5;
  int v6;
  Node *var0;
  WebCore::Node *v9;
  VisiblePosition v11;
  WebCore::Node *v12[3];

  if (self)
  {
    -[WebVisiblePosition _visiblePosition](self, "_visiblePosition");
    if (a3)
    {
LABEL_3:
      objc_msgSend(a3, "_visiblePosition");
      goto LABEL_6;
    }
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    if (a3)
      goto LABEL_3;
  }
  memset(&v11, 0, sizeof(v11));
LABEL_6:
  if (WebCore::operator==((uint64_t)v12, (uint64_t)&v11))
  {
    v5 = 0;
  }
  else
  {
    v6 = (char)WebCore::documentOrder((WebCore *)v12, &v11, v4);
    if (v6 >= 0 || v6 == -127)
      v5 = 1;
    else
      v5 = -1;
  }
  var0 = v11.var0.var0.var0;
  v11.var0.var0.var0 = 0;
  if (var0)
  {
    if (*((_DWORD *)var0 + 6) == 2)
    {
      if ((*((_WORD *)var0 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)var0);
    }
    else
    {
      *((_DWORD *)var0 + 6) -= 2;
    }
  }
  v9 = v12[0];
  v12[0] = 0;
  if (!v9)
    return v5;
  if (*((_DWORD *)v9 + 6) != 2)
  {
    *((_DWORD *)v9 + 6) -= 2;
    return v5;
  }
  if ((*((_WORD *)v9 + 15) & 0x400) != 0)
    return v5;
  WebCore::Node::removedLastRef(v9);
  return v5;
}

- (int)distanceFromPosition:(id)a3
{
  int v4;
  Node *var0;
  WebCore::Node *v6;
  VisiblePosition v8;
  WebCore::Node *v9[3];

  if (self)
  {
    -[WebVisiblePosition _visiblePosition](self, "_visiblePosition");
    if (a3)
    {
LABEL_3:
      objc_msgSend(a3, "_visiblePosition");
      goto LABEL_6;
    }
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    if (a3)
      goto LABEL_3;
  }
  memset(&v8, 0, sizeof(v8));
LABEL_6:
  v4 = WebCore::distanceBetweenPositions((WebCore *)v9, &v8, (const VisiblePosition *)a3);
  var0 = v8.var0.var0.var0;
  v8.var0.var0.var0 = 0;
  if (var0)
  {
    if (*((_DWORD *)var0 + 6) == 2)
    {
      if ((*((_WORD *)var0 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)var0);
    }
    else
    {
      *((_DWORD *)var0 + 6) -= 2;
    }
  }
  v6 = v9[0];
  v9[0] = 0;
  if (!v6)
    return v4;
  if (*((_DWORD *)v6 + 6) != 2)
  {
    *((_DWORD *)v6 + 6) -= 2;
    return v4;
  }
  if ((*((_WORD *)v6 + 15) & 0x400) != 0)
    return v4;
  WebCore::Node::removedLastRef(v6);
  return v4;
}

- (id)description
{
  void *v3;
  WebCore::Node *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  WebCore::Node *v12;
  WebCore::Node *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;
  _QWORD v18[3];

  v17.receiver = self;
  v17.super_class = (Class)WebVisiblePosition;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", -[WebVisiblePosition description](&v17, sel_description));
  if (self)
  {
    -[WebVisiblePosition _visiblePosition](self, "_visiblePosition");
    v4 = v14;
    if (v14)
    {
      v5 = *((_DWORD *)v14 + 6);
      *((_DWORD *)v14 + 6) = v5 + 2;
      v6 = v15;
      if (v5)
      {
        *((_DWORD *)v4 + 6) = v5;
      }
      else if ((*((_WORD *)v4 + 15) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v4);
      }
    }
    else
    {
      v6 = v15;
    }
  }
  else
  {
    v6 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
  }
  WebCore::VisiblePosition::previous();
  v7 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)v18);
  v8 = v18[0];
  v18[0] = 0;
  if (v8)
  {
    if (*(_DWORD *)(v8 + 24) == 2)
    {
      if ((*(_WORD *)(v8 + 30) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)v8);
    }
    else
    {
      *(_DWORD *)(v8 + 24) -= 2;
    }
  }
  v9 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v14);
  WebCore::VisiblePosition::previous();
  v10 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)v18);
  v11 = v18[0];
  v18[0] = 0;
  if (v11)
  {
    if (*(_DWORD *)(v11 + 24) == 2)
    {
      if ((*(_WORD *)(v11 + 30) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)v11);
    }
    else
    {
      *(_DWORD *)(v11 + 24) -= 2;
    }
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("(offset=%d, context=([%c|%c], [u+%04x|u+%04x])"), v6, v7, v9, v10, WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v14));
  v12 = v14;
  v14 = 0;
  if (v12)
  {
    if (*((_DWORD *)v12 + 6) == 2)
    {
      if ((*((_WORD *)v12 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v12);
    }
    else
    {
      *((_DWORD *)v12 + 6) -= 2;
    }
  }
  return v3;
}

- (BOOL)textDirection
{
  return 0;
}

- (BOOL)directionIsDownstream:(int)a3
{
  if (a3 == 1)
    return 0;
  if (!a3)
    return 1;
  if (-[WebVisiblePosition textDirection](self, "textDirection"))
    return a3 == 3;
  return a3 == 2;
}

- (id)positionByMovingInDirection:(int)a3 amount:(unsigned int)a4 withAffinityDownstream:(BOOL)a5
{
  WebCore::Node *v8;
  WebCore::Node *v9;
  WebCore::Node *v10;
  WebCore::Node *v11;
  WebCore::Node *v12;
  WebCore::Node *v13;
  WebCore::Node *v14;
  WebCore::Node *v15;
  WebCore::Node *v16;
  WebCore::Node *v17;
  WebCore::Node *v18;
  WebCore::Node *v19;
  WebCore::Node *v20;
  id v21;
  WebCore::Node *v22;
  WebCore::Node *v23;
  WebCore::Node *v25;
  int v26;
  char v27;
  BOOL v28;
  WebCore::Node *v29;
  int v30;
  char v31;
  char v32;
  WebCore::Node *v33;
  uint64_t v34;
  _BOOL8 v35;

  if (!self)
  {
    v33 = 0;
    v34 = 0;
    v35 = a5;
LABEL_5:
    switch(a3)
    {
      case 0:
        if (!a4)
          goto LABEL_60;
        while (1)
        {
          WebCore::VisiblePosition::next();
          v8 = v29;
          v29 = 0;
          v9 = v33;
          v33 = v8;
          if (v9)
          {
            if (*((_DWORD *)v9 + 6) == 2)
            {
              if ((*((_WORD *)v9 + 15) & 0x400) == 0)
              {
                WebCore::Node::removedLastRef(v9);
                LODWORD(v34) = v30;
                BYTE4(v34) = v31;
                LOBYTE(v35) = v32;
                v29 = 0;
                goto LABEL_10;
              }
            }
            else
            {
              *((_DWORD *)v9 + 6) -= 2;
            }
          }
          LODWORD(v34) = v30;
          BYTE4(v34) = v31;
          LOBYTE(v35) = v32;
LABEL_10:
          if (!--a4)
            goto LABEL_60;
        }
      case 1:
        if (!a4)
          goto LABEL_60;
        while (1)
        {
          WebCore::VisiblePosition::previous();
          v10 = v29;
          v29 = 0;
          v11 = v33;
          v33 = v10;
          if (v11)
          {
            if (*((_DWORD *)v11 + 6) == 2)
            {
              if ((*((_WORD *)v11 + 15) & 0x400) == 0)
              {
                WebCore::Node::removedLastRef(v11);
                LODWORD(v34) = v30;
                BYTE4(v34) = v31;
                LOBYTE(v35) = v32;
                v29 = 0;
                goto LABEL_19;
              }
            }
            else
            {
              *((_DWORD *)v11 + 6) -= 2;
            }
          }
          LODWORD(v34) = v30;
          BYTE4(v34) = v31;
          LOBYTE(v35) = v32;
LABEL_19:
          if (!--a4)
            goto LABEL_60;
        }
      case 2:
        if (!a4)
          goto LABEL_60;
        while (1)
        {
          WebCore::VisiblePosition::right((WebCore::VisiblePosition *)&v33, 0, 0);
          v12 = v29;
          v29 = 0;
          v13 = v33;
          v33 = v12;
          if (v13)
          {
            if (*((_DWORD *)v13 + 6) == 2)
            {
              if ((*((_WORD *)v13 + 15) & 0x400) == 0)
              {
                WebCore::Node::removedLastRef(v13);
                LODWORD(v34) = v30;
                BYTE4(v34) = v31;
                LOBYTE(v35) = v32;
                v29 = 0;
                goto LABEL_28;
              }
            }
            else
            {
              *((_DWORD *)v13 + 6) -= 2;
            }
          }
          LODWORD(v34) = v30;
          BYTE4(v34) = v31;
          LOBYTE(v35) = v32;
LABEL_28:
          if (!--a4)
            goto LABEL_60;
        }
      case 3:
        if (!a4)
          goto LABEL_60;
        while (1)
        {
          WebCore::VisiblePosition::left((WebCore::VisiblePosition *)&v33, 0, 0);
          v14 = v29;
          v29 = 0;
          v15 = v33;
          v33 = v14;
          if (v15)
          {
            if (*((_DWORD *)v15 + 6) == 2)
            {
              if ((*((_WORD *)v15 + 15) & 0x400) == 0)
              {
                WebCore::Node::removedLastRef(v15);
                LODWORD(v34) = v30;
                BYTE4(v34) = v31;
                LOBYTE(v35) = v32;
                v29 = 0;
                goto LABEL_37;
              }
            }
            else
            {
              *((_DWORD *)v15 + 6) -= 2;
            }
          }
          LODWORD(v34) = v30;
          BYTE4(v34) = v31;
          LOBYTE(v35) = v32;
LABEL_37:
          if (!--a4)
            goto LABEL_60;
        }
      case 4:
        WebCore::VisiblePosition::lineDirectionPointForBlockDirectionNavigation((WebCore::VisiblePosition *)&v33);
        if (!a4)
          goto LABEL_60;
        while (1)
        {
          WebCore::previousLinePosition();
          v16 = v29;
          v29 = 0;
          v17 = v33;
          v33 = v16;
          if (v17)
          {
            if (*((_DWORD *)v17 + 6) == 2)
            {
              if ((*((_WORD *)v17 + 15) & 0x400) == 0)
              {
                WebCore::Node::removedLastRef(v17);
                LODWORD(v34) = v30;
                BYTE4(v34) = v31;
                LOBYTE(v35) = v32;
                v29 = 0;
                goto LABEL_46;
              }
            }
            else
            {
              *((_DWORD *)v17 + 6) -= 2;
            }
          }
          LODWORD(v34) = v30;
          BYTE4(v34) = v31;
          LOBYTE(v35) = v32;
LABEL_46:
          if (!--a4)
            goto LABEL_60;
        }
      case 5:
        WebCore::VisiblePosition::lineDirectionPointForBlockDirectionNavigation((WebCore::VisiblePosition *)&v33);
        if (!a4)
          goto LABEL_60;
        break;
      default:
        goto LABEL_60;
    }
    while (1)
    {
      WebCore::nextLinePosition();
      v18 = v29;
      v29 = 0;
      v19 = v33;
      v33 = v18;
      if (v19)
      {
        if (*((_DWORD *)v19 + 6) == 2)
        {
          if ((*((_WORD *)v19 + 15) & 0x400) == 0)
          {
            WebCore::Node::removedLastRef(v19);
            LODWORD(v34) = v30;
            BYTE4(v34) = v31;
            LOBYTE(v35) = v32;
            v29 = 0;
            goto LABEL_55;
          }
        }
        else
        {
          *((_DWORD *)v19 + 6) -= 2;
        }
      }
      LODWORD(v34) = v30;
      BYTE4(v34) = v31;
      LOBYTE(v35) = v32;
LABEL_55:
      if (!--a4)
        goto LABEL_60;
    }
  }
  -[WebVisiblePosition _visiblePosition](self, "_visiblePosition");
  LOBYTE(v35) = a5;
  if (a3 <= 5)
    goto LABEL_5;
LABEL_60:
  v20 = v33;
  if (v33)
    *((_DWORD *)v33 + 6) += 2;
  v25 = v20;
  v26 = v34;
  v27 = BYTE4(v34);
  v28 = v35;
  v21 = +[WebVisiblePosition _wrapVisiblePositionIfValid:](WebVisiblePosition, "_wrapVisiblePositionIfValid:", &v25);
  v22 = v25;
  v25 = 0;
  if (v22)
  {
    if (*((_DWORD *)v22 + 6) == 2)
    {
      if ((*((_WORD *)v22 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v22);
    }
    else
    {
      *((_DWORD *)v22 + 6) -= 2;
    }
  }
  v23 = v33;
  v33 = 0;
  if (!v23)
    return v21;
  if (*((_DWORD *)v23 + 6) != 2)
  {
    *((_DWORD *)v23 + 6) -= 2;
    return v21;
  }
  if ((*((_WORD *)v23 + 15) & 0x400) != 0)
    return v21;
  WebCore::Node::removedLastRef(v23);
  return v21;
}

- (id)positionByMovingInDirection:(int)a3 amount:(unsigned int)a4
{
  return -[WebVisiblePosition positionByMovingInDirection:amount:withAffinityDownstream:](self, "positionByMovingInDirection:amount:withAffinityDownstream:", *(_QWORD *)&a3, *(_QWORD *)&a4, 1);
}

- (BOOL)atBoundaryOfGranularity:(int)a3 inDirection:(int)a4
{
  char v4;
  WebCore::Node *v6;

  if (self)
    -[WebVisiblePosition _visiblePosition](self, "_visiblePosition");
  else
    v6 = 0;
  v4 = WebCore::atBoundaryOfGranularity();
  if (!v6)
    return v4;
  if (*((_DWORD *)v6 + 6) != 2)
  {
    *((_DWORD *)v6 + 6) -= 2;
    return v4;
  }
  if ((*((_WORD *)v6 + 15) & 0x400) != 0)
    return v4;
  WebCore::Node::removedLastRef(v6);
  return v4;
}

- (id)positionOfNextBoundaryOfGranularity:(int)a3 inDirection:(int)a4
{
  id v4;
  WebCore::Node *v5;
  WebCore::Node *v7;
  WebCore::Node *v8;

  if (self)
    -[WebVisiblePosition _visiblePosition](self, "_visiblePosition");
  else
    v7 = 0;
  WebCore::positionOfNextBoundaryOfGranularity();
  v4 = +[WebVisiblePosition _wrapVisiblePositionIfValid:](WebVisiblePosition, "_wrapVisiblePositionIfValid:", &v8);
  v5 = v8;
  v8 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 6) == 2)
    {
      if ((*((_WORD *)v5 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v5);
    }
    else
    {
      *((_DWORD *)v5 + 6) -= 2;
    }
  }
  if (!v7)
    return v4;
  if (*((_DWORD *)v7 + 6) != 2)
  {
    *((_DWORD *)v7 + 6) -= 2;
    return v4;
  }
  if ((*((_WORD *)v7 + 15) & 0x400) != 0)
    return v4;
  WebCore::Node::removedLastRef(v7);
  return v4;
}

- (BOOL)withinTextUnitOfGranularity:(int)a3 inDirectionIfAtBoundary:(int)a4
{
  char v4;
  WebCore::Node *v6;

  if (self)
    -[WebVisiblePosition _visiblePosition](self, "_visiblePosition");
  else
    v6 = 0;
  v4 = WebCore::withinTextUnitOfGranularity();
  if (!v6)
    return v4;
  if (*((_DWORD *)v6 + 6) != 2)
  {
    *((_DWORD *)v6 + 6) -= 2;
    return v4;
  }
  if ((*((_WORD *)v6 + 15) & 0x400) != 0)
    return v4;
  WebCore::Node::removedLastRef(v6);
  return v4;
}

- (id)enclosingTextUnitOfGranularity:(int)a3 inDirectionIfAtBoundary:(int)a4
{
  DOMObjectInternal *v4;
  WebCore::Node *v6;
  WebCore::Node *v7;
  WebCore::Node *v8;
  char v9;
  DOMObjectInternal *v10;

  if (self)
    -[WebVisiblePosition _visiblePosition](self, "_visiblePosition");
  else
    v6 = 0;
  WebCore::enclosingTextUnitOfGranularity();
  WebCore::createLiveRange();
  v4 = kit(v10);
  if (!v10)
  {
LABEL_7:
    if (!v9)
      goto LABEL_20;
    goto LABEL_10;
  }
  if (*((_DWORD *)v10 + 2) != 1)
  {
    --*((_DWORD *)v10 + 2);
    goto LABEL_7;
  }
  (*(void (**)())(*(_QWORD *)v10 + 8))();
  if (!v9)
    goto LABEL_20;
LABEL_10:
  if (v8)
  {
    if (*((_DWORD *)v8 + 6) == 2)
    {
      if ((*((_WORD *)v8 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v8);
    }
    else
    {
      *((_DWORD *)v8 + 6) -= 2;
    }
  }
  if (v7)
  {
    if (*((_DWORD *)v7 + 6) == 2)
    {
      if ((*((_WORD *)v7 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v7);
    }
    else
    {
      *((_DWORD *)v7 + 6) -= 2;
    }
  }
LABEL_20:
  if (!v6)
    return v4;
  if (*((_DWORD *)v6 + 6) != 2)
  {
    *((_DWORD *)v6 + 6) -= 2;
    return v4;
  }
  if ((*((_WORD *)v6 + 15) & 0x400) != 0)
    return v4;
  WebCore::Node::removedLastRef(v6);
  return v4;
}

- (id)positionAtStartOrEndOfWord
{
  WebCore::Node *v2;
  char v3;
  char v4;
  UChar32 v5;
  unsigned int IntPropertyValue;
  WebCore::Node *v7;
  int v8;
  int v9;
  WebCore::Node *v10;
  int v11;
  int v12;
  int v13;
  WebCore::Node *v14;
  WebCore::Node *v15;
  WebCore::Node *v16;
  WebCore::Node *v17;
  WebCore::Node *v18;
  UTF32Char v19;
  const __CFCharacterSet *Predefined;
  const VisiblePosition *v21;
  const __CFCharacterSet *v22;
  UTF32Char v23;
  WebCore::Node *v24;
  WebCore::Node *v25;
  WebCore::Node *v26;
  WebCore::Node *v27;
  WebCore::Node *v28;
  int v29;
  WebCore::Node *v30;
  WebCore::Node *v31;
  WebCore::Node *v32;
  WebCore::Node *v33;
  id v34;
  WebCore::Node *v35;
  WebCore::Node *v36;
  UTF32Char v38;
  WebCore::Node *v39;
  const VisiblePosition *v40;
  WebCore::Node *v41;
  WebCore::Node *v42;
  WebCore::Node *v43;
  UTF32Char v44;
  WebCore::Node *v45;
  const VisiblePosition *v46;
  WebCore::Node *v47;
  WebCore::Node *v48;
  WebCore::Node *v49;
  WebCore::Node *v50;
  WebCore::Node *v51;
  UTF32Char v52;
  WebCore::Node *v53;
  WebCore::Node *v54;
  WebCore::Node *v55;
  WebCore::Node *v56;
  int v57;
  char v58;
  char v59;
  WebCore::Node *v60;
  int v61;
  char v62;
  char v63;
  WebCore::Node *v64;
  int v65;
  char v66;
  WebCore::Node *v67;
  int v68;
  char v69;
  char v70;
  WebCore::Node *v71;
  int v72;
  char v73;
  WebCore::Node *v74;
  int v75;
  char v76;
  char v77;
  WebCore::Node *v78;
  uint64_t v79;
  uint64_t v80;
  WebCore::Node *v81;
  int v82;
  char v83;
  char v84;

  if (self)
  {
    -[WebVisiblePosition _visiblePosition](self, "_visiblePosition");
    v2 = v78;
    if (v78)
    {
      v3 = 0;
      *((_DWORD *)v78 + 6) += 2;
    }
    else
    {
      v3 = 1;
    }
  }
  else
  {
    v2 = 0;
    v78 = 0;
    v79 = 0;
    v3 = 1;
    v80 = 0;
  }
  v74 = v2;
  v75 = v79;
  v76 = BYTE4(v79);
  v4 = v80;
  v77 = v80;
  v5 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v78);
  IntPropertyValue = u_getIntPropertyValue(v5, UCHAR_LINE_BREAK);
  if (IntPropertyValue > 0x25 || ((1 << IntPropertyValue) & 0x2001004000) == 0)
  {
    v19 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v78);
    Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
    v22 = Predefined;
    if (!v19 || CFCharacterSetIsLongCharacterMember(Predefined, v19))
    {
      while (v78)
      {
        if ((WebCore::isStartOfLine((WebCore *)&v78, v21) & 1) != 0)
          goto LABEL_84;
        WebCore::VisiblePosition::previous();
        v23 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v81);
        v24 = v81;
        v81 = 0;
        if (v24)
        {
          if (*((_DWORD *)v24 + 6) == 2)
          {
            if ((*((_WORD *)v24 + 15) & 0x400) == 0)
              WebCore::Node::removedLastRef(v24);
          }
          else
          {
            *((_DWORD *)v24 + 6) -= 2;
          }
        }
        if (!CFCharacterSetIsLongCharacterMember(v22, v23))
          goto LABEL_84;
        WebCore::VisiblePosition::previous();
        v25 = v81;
        v81 = 0;
        v26 = v78;
        v78 = v25;
        if (v26)
        {
          if (*((_DWORD *)v26 + 6) == 2)
          {
            if ((*((_WORD *)v26 + 15) & 0x400) == 0)
            {
              WebCore::Node::removedLastRef(v26);
              v27 = v81;
              LODWORD(v79) = v82;
              BYTE4(v79) = v83;
              LOBYTE(v80) = v84;
              v81 = 0;
              if (v27)
              {
                if (*((_DWORD *)v27 + 6) == 2)
                {
                  if ((*((_WORD *)v27 + 15) & 0x400) == 0)
                    WebCore::Node::removedLastRef(v27);
                }
                else
                {
                  *((_DWORD *)v27 + 6) -= 2;
                }
              }
              continue;
            }
          }
          else
          {
            *((_DWORD *)v26 + 6) -= 2;
          }
        }
        LODWORD(v79) = v82;
        BYTE4(v79) = v83;
        LOBYTE(v80) = v84;
      }
LABEL_158:
      v33 = 0;
      goto LABEL_86;
    }
    if (!v78)
      goto LABEL_158;
    if ((WebCore::isStartOfLine((WebCore *)&v78, v21) & 1) != 0)
      goto LABEL_84;
    WebCore::VisiblePosition::previous();
    v38 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v81);
    v39 = v81;
    v81 = 0;
    if (v39)
    {
      if (*((_DWORD *)v39 + 6) == 2)
      {
        if ((*((_WORD *)v39 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v39);
      }
      else
      {
        *((_DWORD *)v39 + 6) -= 2;
      }
    }
    if (CFCharacterSetIsLongCharacterMember(v22, v38))
      goto LABEL_84;
    WebCore::VisiblePosition::previous();
    v41 = v81;
    v81 = 0;
    v42 = v78;
    v78 = v41;
    if (v42)
    {
      if (*((_DWORD *)v42 + 6) == 2)
      {
        if ((*((_WORD *)v42 + 15) & 0x400) == 0)
        {
          WebCore::Node::removedLastRef(v42);
          v43 = v81;
          LODWORD(v79) = v82;
          BYTE4(v79) = v83;
          LOBYTE(v80) = v84;
          v81 = 0;
          if (v43)
          {
            if (*((_DWORD *)v43 + 6) == 2)
            {
              if ((*((_WORD *)v43 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef(v43);
            }
            else
            {
              *((_DWORD *)v43 + 6) -= 2;
            }
          }
LABEL_118:
          if (!v78)
            goto LABEL_158;
          if ((WebCore::isStartOfLine((WebCore *)&v78, v40) & 1) != 0)
            goto LABEL_84;
          WebCore::VisiblePosition::previous();
          v44 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v81);
          v45 = v81;
          v81 = 0;
          if (v45)
          {
            if (*((_DWORD *)v45 + 6) == 2)
            {
              if ((*((_WORD *)v45 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef(v45);
            }
            else
            {
              *((_DWORD *)v45 + 6) -= 2;
            }
          }
          if (CFCharacterSetIsLongCharacterMember(v22, v44))
            goto LABEL_84;
          WebCore::VisiblePosition::previous();
          v47 = v81;
          v81 = 0;
          v48 = v78;
          v78 = v47;
          if (v48)
          {
            if (*((_DWORD *)v48 + 6) == 2)
            {
              if ((*((_WORD *)v48 + 15) & 0x400) == 0)
              {
                WebCore::Node::removedLastRef(v48);
                v49 = v81;
                LODWORD(v79) = v82;
                BYTE4(v79) = v83;
                LOBYTE(v80) = v84;
                v81 = 0;
                if (v49)
                {
                  if (*((_DWORD *)v49 + 6) == 2)
                  {
                    if ((*((_WORD *)v49 + 15) & 0x400) == 0)
                      WebCore::Node::removedLastRef(v49);
                  }
                  else
                  {
                    *((_DWORD *)v49 + 6) -= 2;
                  }
                }
LABEL_136:
                if ((v3 & 1) == 0)
                  *((_DWORD *)v2 + 6) += 2;
                v50 = v78;
                v78 = v2;
                v51 = v2;
                if (v50)
                {
                  if (*((_DWORD *)v50 + 6) == 2)
                  {
                    v51 = v2;
                    if ((*((_WORD *)v50 + 15) & 0x400) == 0)
                    {
                      WebCore::Node::removedLastRef(v50);
                      v51 = v78;
                    }
                  }
                  else
                  {
                    *((_DWORD *)v50 + 6) -= 2;
                    v51 = v2;
                  }
                }
                LODWORD(v79) = v75;
                BYTE4(v79) = v76;
                LOBYTE(v80) = v4;
                if (!v51)
                  goto LABEL_158;
                while (1)
                {
                  if ((WebCore::isEndOfLine((WebCore *)&v78, v46) & 1) != 0)
                    goto LABEL_84;
                  v52 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v78);
                  if (CFCharacterSetIsLongCharacterMember(v22, v52))
                    goto LABEL_84;
                  WebCore::VisiblePosition::next();
                  v53 = v81;
                  v81 = 0;
                  v54 = v78;
                  v78 = v53;
                  if (v54)
                  {
                    if (*((_DWORD *)v54 + 6) == 2)
                    {
                      if ((*((_WORD *)v54 + 15) & 0x400) == 0)
                      {
                        WebCore::Node::removedLastRef(v54);
                        v55 = v81;
                        LODWORD(v79) = v82;
                        BYTE4(v79) = v83;
                        LOBYTE(v80) = v84;
                        v81 = 0;
                        if (v55)
                        {
                          if (*((_DWORD *)v55 + 6) == 2)
                          {
                            if ((*((_WORD *)v55 + 15) & 0x400) == 0)
                              WebCore::Node::removedLastRef(v55);
                          }
                          else
                          {
                            *((_DWORD *)v55 + 6) -= 2;
                          }
                        }
                        goto LABEL_147;
                      }
                    }
                    else
                    {
                      *((_DWORD *)v54 + 6) -= 2;
                    }
                  }
                  LODWORD(v79) = v82;
                  BYTE4(v79) = v83;
                  LOBYTE(v80) = v84;
LABEL_147:
                  if (!v78)
                    goto LABEL_158;
                }
              }
            }
            else
            {
              *((_DWORD *)v48 + 6) -= 2;
            }
          }
          LODWORD(v79) = v82;
          BYTE4(v79) = v83;
          LOBYTE(v80) = v84;
          goto LABEL_136;
        }
      }
      else
      {
        *((_DWORD *)v42 + 6) -= 2;
      }
    }
    LODWORD(v79) = v82;
    BYTE4(v79) = v83;
    LOBYTE(v80) = v84;
    goto LABEL_118;
  }
  WebCore::startOfWord();
  v7 = v81;
  if (v81)
    *((_DWORD *)v81 + 6) += 2;
  v71 = v7;
  v72 = v82;
  v73 = v83;
  if ((v83 & 8) == 0 && ((v8 = v83 & 7, v8 == 2) || v8 == 4))
    v9 = WebCore::Position::offsetForPositionAfterAnchor((WebCore::Position *)&v71);
  else
    v9 = v72;
  v10 = v78;
  if (v78)
    *((_DWORD *)v78 + 6) += 2;
  v67 = v10;
  v68 = v79;
  v69 = BYTE4(v79);
  if ((v79 & 0x800000000) == 0 && ((v11 = v69 & 7, v11 == 2) || v11 == 4))
  {
    v12 = WebCore::Position::offsetForPositionAfterAnchor((WebCore::Position *)&v67);
    v10 = v67;
  }
  else
  {
    v12 = v68;
  }
  v13 = v9 + 1;
  v67 = 0;
  if (v10)
  {
    if (*((_DWORD *)v10 + 6) == 2)
    {
      if ((*((_WORD *)v10 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v10);
    }
    else
    {
      *((_DWORD *)v10 + 6) -= 2;
    }
  }
  if (v13 < v12)
  {
    WebCore::endOfWord();
    v14 = v67;
    if (v67)
      *((_DWORD *)v67 + 6) += 2;
    v64 = v14;
    v65 = v68;
    v66 = v69;
    WebCore::VisiblePosition::VisiblePosition();
    v15 = v60;
    v60 = 0;
    v16 = v78;
    v78 = v15;
    if (v16)
    {
      if (*((_DWORD *)v16 + 6) == 2)
      {
        if ((*((_WORD *)v16 + 15) & 0x400) == 0)
        {
          WebCore::Node::removedLastRef(v16);
          LODWORD(v79) = v61;
          BYTE4(v79) = v62;
          LOBYTE(v80) = v63;
          v60 = 0;
          goto LABEL_66;
        }
      }
      else
      {
        *((_DWORD *)v16 + 6) -= 2;
      }
    }
    LODWORD(v79) = v61;
    BYTE4(v79) = v62;
    LOBYTE(v80) = v63;
LABEL_66:
    v30 = v64;
    v64 = 0;
    if (v30)
    {
      if (*((_DWORD *)v30 + 6) == 2)
      {
        if ((*((_WORD *)v30 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v30);
      }
      else
      {
        *((_DWORD *)v30 + 6) -= 2;
      }
    }
    v28 = v67;
    v67 = 0;
    if (!v28)
      goto LABEL_74;
    v29 = *((_DWORD *)v28 + 6) - 2;
    if (*((_DWORD *)v28 + 6) != 2)
      goto LABEL_73;
    goto LABEL_60;
  }
  WebCore::VisiblePosition::VisiblePosition();
  v17 = v67;
  v67 = 0;
  v18 = v78;
  v78 = v17;
  if (!v18)
    goto LABEL_62;
  if (*((_DWORD *)v18 + 6) != 2)
  {
    *((_DWORD *)v18 + 6) -= 2;
LABEL_62:
    LODWORD(v79) = v68;
    BYTE4(v79) = v69;
    LOBYTE(v80) = v70;
    goto LABEL_74;
  }
  if ((*((_WORD *)v18 + 15) & 0x400) != 0)
    goto LABEL_62;
  WebCore::Node::removedLastRef(v18);
  v28 = v67;
  LODWORD(v79) = v68;
  BYTE4(v79) = v69;
  LOBYTE(v80) = v70;
  v67 = 0;
  if (v28)
  {
    v29 = *((_DWORD *)v28 + 6) - 2;
    if (*((_DWORD *)v28 + 6) != 2)
    {
LABEL_73:
      *((_DWORD *)v28 + 6) = v29;
      goto LABEL_74;
    }
LABEL_60:
    if ((*((_WORD *)v28 + 15) & 0x400) == 0)
      WebCore::Node::removedLastRef(v28);
  }
LABEL_74:
  v31 = v71;
  v71 = 0;
  if (v31)
  {
    if (*((_DWORD *)v31 + 6) == 2)
    {
      if ((*((_WORD *)v31 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v31);
    }
    else
    {
      *((_DWORD *)v31 + 6) -= 2;
    }
  }
  v32 = v81;
  v81 = 0;
  if (v32)
  {
    if (*((_DWORD *)v32 + 6) == 2)
    {
      if ((*((_WORD *)v32 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v32);
    }
    else
    {
      *((_DWORD *)v32 + 6) -= 2;
    }
  }
LABEL_84:
  v33 = v78;
  if (v78)
    *((_DWORD *)v78 + 6) += 2;
LABEL_86:
  v56 = v33;
  v57 = v79;
  v58 = BYTE4(v79);
  v59 = v80;
  v34 = +[WebVisiblePosition _wrapVisiblePositionIfValid:](WebVisiblePosition, "_wrapVisiblePositionIfValid:", &v56);
  v35 = v56;
  v56 = 0;
  if (v35)
  {
    if (*((_DWORD *)v35 + 6) == 2)
    {
      if ((*((_WORD *)v35 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v35);
    }
    else
    {
      *((_DWORD *)v35 + 6) -= 2;
    }
  }
  if ((v3 & 1) == 0)
  {
    if (*((_DWORD *)v2 + 6) == 2)
    {
      if ((*((_WORD *)v2 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v2);
    }
    else
    {
      *((_DWORD *)v2 + 6) -= 2;
    }
  }
  v36 = v78;
  v78 = 0;
  if (v36)
  {
    if (*((_DWORD *)v36 + 6) == 2)
    {
      if ((*((_WORD *)v36 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v36);
    }
    else
    {
      *((_DWORD *)v36 + 6) -= 2;
    }
  }
  return v34;
}

- (BOOL)isEditable
{
  WebCore::Node *v2;
  char isEditablePosition;
  WebCore::Node *v5;
  WebCore::Node *v6;

  if (self)
  {
    -[WebVisiblePosition _visiblePosition](self, "_visiblePosition");
    v2 = v5;
    if (v5)
      *((_DWORD *)v5 + 6) += 2;
  }
  else
  {
    v2 = 0;
    v5 = 0;
  }
  v6 = v2;
  isEditablePosition = WebCore::isEditablePosition();
  if (v6)
  {
    if (*((_DWORD *)v6 + 6) == 2)
    {
      if ((*((_WORD *)v6 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v6);
    }
    else
    {
      *((_DWORD *)v6 + 6) -= 2;
    }
  }
  if (!v5)
    return isEditablePosition;
  if (*((_DWORD *)v5 + 6) != 2)
  {
    *((_DWORD *)v5 + 6) -= 2;
    return isEditablePosition;
  }
  if ((*((_WORD *)v5 + 15) & 0x400) != 0)
    return isEditablePosition;
  WebCore::Node::removedLastRef(v5);
  return isEditablePosition;
}

- (BOOL)requiresContextForWordBoundary
{
  UChar32 v2;
  unsigned int IntPropertyValue;
  BOOL v4;
  WebCore::Node *v5;
  UChar32 v6;
  WebCore::Node *v7;
  unsigned int v8;
  WebCore::Node *v10[3];
  WebCore::Node *v11;

  if (self)
    -[WebVisiblePosition _visiblePosition](self, "_visiblePosition");
  else
    memset(v10, 0, sizeof(v10));
  v2 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)v10);
  IntPropertyValue = u_getIntPropertyValue(v2, UCHAR_LINE_BREAK);
  if (IntPropertyValue <= 0x25 && ((1 << IntPropertyValue) & 0x2001004000) != 0)
  {
    v4 = 1;
    v5 = v10[0];
    v10[0] = 0;
    if (!v5)
      return v4;
  }
  else
  {
    WebCore::VisiblePosition::previous();
    v6 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v11);
    v7 = v11;
    v11 = 0;
    if (v7)
    {
      if (*((_DWORD *)v7 + 6) == 2)
      {
        if ((*((_WORD *)v7 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v7);
      }
      else
      {
        *((_DWORD *)v7 + 6) -= 2;
      }
    }
    v8 = u_getIntPropertyValue(v6, UCHAR_LINE_BREAK);
    if (v8 <= 0x25)
      v4 = (0x2001004000uLL >> v8) & 1;
    else
      v4 = 0;
    v5 = v10[0];
    v10[0] = 0;
    if (!v5)
      return v4;
  }
  if (*((_DWORD *)v5 + 6) != 2)
  {
    *((_DWORD *)v5 + 6) -= 2;
    return v4;
  }
  if ((*((_WORD *)v5 + 15) & 0x400) != 0)
    return v4;
  WebCore::Node::removedLastRef(v5);
  return v4;
}

- (BOOL)atAlphaNumericBoundaryInDirection:(int)a3
{
  uint64_t v3;
  UniChar v5;
  WebCore::Node *v6;
  UniChar v7;
  int IsCharacterMember;
  int v9;
  _BOOL4 v10;
  BOOL v11;
  BOOL v12;
  WebCore::Node *v13;
  WebCore::Node *v15[3];
  WebCore::Node *v16;

  v3 = *(_QWORD *)&a3;
  if ((_MergedGlobals_26 & 1) != 0)
  {
    if (self)
    {
LABEL_3:
      -[WebVisiblePosition _visiblePosition](self, "_visiblePosition");
      goto LABEL_6;
    }
  }
  else
  {
    qword_1ECEC99A0 = (uint64_t)CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
    _MergedGlobals_26 = 1;
    if (self)
      goto LABEL_3;
  }
  memset(v15, 0, sizeof(v15));
LABEL_6:
  WebCore::VisiblePosition::previous();
  v5 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v16);
  v6 = v16;
  v16 = 0;
  if (v6)
  {
    if (*((_DWORD *)v6 + 6) == 2)
    {
      if ((*((_WORD *)v6 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v6);
    }
    else
    {
      *((_DWORD *)v6 + 6) -= 2;
    }
  }
  v7 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)v15);
  IsCharacterMember = CFCharacterSetIsCharacterMember((CFCharacterSetRef)qword_1ECEC99A0, v5);
  v9 = CFCharacterSetIsCharacterMember((CFCharacterSetRef)qword_1ECEC99A0, v7);
  v10 = -[WebVisiblePosition directionIsDownstream:](self, "directionIsDownstream:", v3);
  if (v10)
    v11 = v9 == 0;
  else
    v11 = v9 != 0;
  if (v10)
    v12 = IsCharacterMember != 0;
  else
    v12 = IsCharacterMember == 0;
  v13 = v15[0];
  v15[0] = 0;
  if (v13)
  {
    if (*((_DWORD *)v13 + 6) == 2)
    {
      if ((*((_WORD *)v13 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v13);
    }
    else
    {
      *((_DWORD *)v13 + 6) -= 2;
    }
  }
  return v12 && v11;
}

- (id)enclosingRangeWithDictationPhraseAlternatives:(id *)a3
{
  DOMObjectInternal *v4;
  int v5;
  void *v6;
  int v7;
  BOOL v8;
  unsigned int v9;
  void *v10;
  WTF *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  _DWORD *v15;
  CFTypeRef v16;
  CFTypeRef v17;
  DOMObjectInternal *v18;
  WebCore::Node *v19;
  WebCore::Node *v20;
  WTF *v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int v24;
  int *v25;
  id result;
  WebCore::Node *v27;
  unsigned int v28;
  WebCore::Node *v29;
  int v30;
  CFTypeRef cf;
  unsigned int v32;
  char v33;
  WebCore::Node *v34;
  int v35;
  char v36;
  WTF *v37;
  int v38;
  unsigned int v39;
  int *v40;
  unsigned int v41;
  char v42;
  DOMObjectInternal *v43;

  if (!a3)
    return 0;
  *a3 = 0;
  if (!self)
    return 0;
  -[WebVisiblePosition _visiblePosition](self, "_visiblePosition");
  v4 = (DOMObjectInternal *)v40;
  if (v40)
  {
    v5 = v40[6];
    v40[6] = v5 + 2;
    if (v5)
    {
      *((_DWORD *)v4 + 6) = v5;
    }
    else
    {
      if ((*((_WORD *)v4 + 15) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v4);
        v6 = v40;
        if (!v40)
        {
LABEL_13:
          cf = v6;
          v32 = v41;
          v33 = v42;
          if ((v42 & 8) == 0 && ((v7 = v33 & 7, v7 != 2) ? (v8 = v7 == 4) : (v8 = 1), v8))
          {
            v9 = WebCore::Position::offsetForPositionAfterAnchor((WebCore::Position *)&cf);
            v6 = (void *)cf;
          }
          else
          {
            v9 = v32;
          }
          cf = 0;
          if (v6)
          {
            if (*((_DWORD *)v6 + 6) == 2)
            {
              if ((*((_WORD *)v6 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef((WebCore::Node *)v6);
            }
            else
            {
              *((_DWORD *)v6 + 6) -= 2;
            }
          }
          if (!*(_QWORD *)(*(_QWORD *)(*((_QWORD *)v4 + 5) + 8) + 1496))
            WebCore::Document::ensureMarkers(*(WebCore::Document **)(*((_QWORD *)v4 + 5) + 8));
          WebCore::DocumentMarkerController::markersFor();
          v11 = v37;
          v12 = v39;
          if (!v39)
          {
            v4 = 0;
LABEL_64:
            if (v11)
            {
              v37 = 0;
              v38 = 0;
              WTF::fastFree(v11, v10);
            }
            v25 = v40;
            v40 = 0;
            if (v25)
            {
              if (v25[6] == 2)
              {
                if ((*((_WORD *)v25 + 15) & 0x400) == 0)
                  WebCore::Node::removedLastRef((WebCore::Node *)v25);
              }
              else
              {
                v25[6] -= 2;
              }
            }
            return v4;
          }
          v13 = 0;
          while (1)
          {
            v14 = *(_QWORD *)((char *)v37 + v13);
            if (v14)
            {
              v15 = *(_DWORD **)(v14 + 8);
              if (v15[3] <= v9 && v15[4] >= v9)
                break;
            }
            v13 += 8;
            if (8 * v39 == v13)
            {
              v4 = 0;
              goto LABEL_56;
            }
          }
          if (v15[24] != 2)
          {
            result = (id)std::__throw_bad_variant_access[abi:sn180100]();
            __break(1u);
            return result;
          }
          WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&>((uint64_t)(v15 + 8), (uint64_t *)&cf);
          v16 = cf;
          cf = 0;
          *a3 = (id)(id)CFMakeCollectable(v16);
          v17 = cf;
          cf = 0;
          if (v17)
            CFRelease(v17);
          WebCore::makeSimpleRange();
          cf = v27;
          v32 = v28;
          v34 = v29;
          v35 = v30;
          v36 = 1;
          WebCore::createLiveRange();
          v4 = kit(v43);
          v18 = v43;
          v43 = 0;
          if (v18)
          {
            if (*((_DWORD *)v18 + 2) == 1)
            {
              (*(void (**)(DOMObjectInternal *))(*(_QWORD *)v18 + 8))(v18);
              if (!v36)
              {
LABEL_55:
                v12 = v39;
                v11 = v37;
                if (!v39)
                  goto LABEL_64;
LABEL_56:
                v21 = (WTF *)((char *)v11 + 8 * v12);
                do
                {
                  while (1)
                  {
                    v22 = *(unsigned int **)v11;
                    *(_QWORD *)v11 = 0;
                    if (v22)
                    {
                      do
                      {
                        v23 = __ldaxr(v22);
                        v24 = v23 - 1;
                      }
                      while (__stlxr(v24, v22));
                      if (!v24)
                        break;
                    }
                    v11 = (WTF *)((char *)v11 + 8);
                    if (v11 == v21)
                      goto LABEL_63;
                  }
                  atomic_store(1u, v22);
                  WTF::fastFree((WTF *)v22, v10);
                  v11 = (WTF *)((char *)v11 + 8);
                }
                while (v11 != v21);
LABEL_63:
                v11 = v37;
                goto LABEL_64;
              }
LABEL_45:
              v19 = v34;
              v34 = 0;
              if (v19)
              {
                if (*((_DWORD *)v19 + 6) == 2)
                {
                  if ((*((_WORD *)v19 + 15) & 0x400) == 0)
                    WebCore::Node::removedLastRef(v19);
                }
                else
                {
                  *((_DWORD *)v19 + 6) -= 2;
                }
              }
              v20 = (WebCore::Node *)cf;
              cf = 0;
              if (v20)
              {
                if (*((_DWORD *)v20 + 6) == 2)
                {
                  if ((*((_WORD *)v20 + 15) & 0x400) == 0)
                    WebCore::Node::removedLastRef(v20);
                }
                else
                {
                  *((_DWORD *)v20 + 6) -= 2;
                }
              }
              goto LABEL_55;
            }
            --*((_DWORD *)v18 + 2);
          }
          if (!v36)
            goto LABEL_55;
          goto LABEL_45;
        }
        v5 = v40[6];
LABEL_12:
        *((_DWORD *)v6 + 6) = v5 + 2;
        goto LABEL_13;
      }
      v5 = 2;
    }
    v6 = v4;
    goto LABEL_12;
  }
  return v4;
}

- (id)enclosingRangeWithCorrectionIndicator
{
  DOMObjectInternal *v2;
  int v3;
  WebCore::Node *v4;
  int v5;
  BOOL v6;
  unsigned int v7;
  _DWORD *v8;
  WTF *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  DOMObjectInternal *v13;
  WebCore::Node *v14;
  WebCore::Node *v15;
  WTF *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;
  int *v20;
  WebCore::Node *v22;
  unsigned int v23;
  WebCore::Node *v24;
  int v25;
  WebCore::Node *v26;
  unsigned int v27;
  char v28;
  WebCore::Node *v29;
  int v30;
  char v31;
  WTF *v32;
  int v33;
  unsigned int v34;
  int *v35;
  unsigned int v36;
  char v37;
  DOMObjectInternal *v38;

  if (!self)
    return 0;
  -[WebVisiblePosition _visiblePosition](self, "_visiblePosition");
  v2 = (DOMObjectInternal *)v35;
  if (v35)
  {
    v3 = v35[6];
    v35[6] = v3 + 2;
    if (v3)
    {
      *((_DWORD *)v2 + 6) = v3;
    }
    else
    {
      if ((*((_WORD *)v2 + 15) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v2);
        v4 = (WebCore::Node *)v35;
        if (!v35)
        {
LABEL_12:
          v26 = v4;
          v27 = v36;
          v28 = v37;
          if ((v37 & 8) == 0 && ((v5 = v28 & 7, v5 != 2) ? (v6 = v5 == 4) : (v6 = 1), v6))
          {
            v7 = WebCore::Position::offsetForPositionAfterAnchor((WebCore::Position *)&v26);
            v4 = v26;
          }
          else
          {
            v7 = v27;
          }
          v26 = 0;
          if (v4)
          {
            if (*((_DWORD *)v4 + 6) == 2)
            {
              if ((*((_WORD *)v4 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef(v4);
            }
            else
            {
              *((_DWORD *)v4 + 6) -= 2;
            }
          }
          if (!*(_QWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 5) + 8) + 1496))
            WebCore::Document::ensureMarkers(*(WebCore::Document **)(*((_QWORD *)v2 + 5) + 8));
          WebCore::DocumentMarkerController::markersFor();
          v9 = v32;
          v10 = v34;
          if (!v34)
          {
            v2 = 0;
LABEL_60:
            if (v9)
            {
              v32 = 0;
              v33 = 0;
              WTF::fastFree(v9, v8);
            }
            v20 = v35;
            v35 = 0;
            if (v20)
            {
              if (v20[6] != 2)
              {
                v20[6] -= 2;
                return v2;
              }
              if ((*((_WORD *)v20 + 15) & 0x400) == 0)
              {
                WebCore::Node::removedLastRef((WebCore::Node *)v20);
                return v2;
              }
            }
            return v2;
          }
          v11 = 0;
          while (1)
          {
            v12 = *(_QWORD *)((char *)v32 + v11);
            if (v12)
            {
              v8 = *(_DWORD **)(v12 + 8);
              if (v8[3] <= v7 && v8[4] >= v7)
                break;
            }
            v11 += 8;
            if (8 * v34 == v11)
            {
              v2 = 0;
              goto LABEL_52;
            }
          }
          WebCore::makeSimpleRange();
          v26 = v22;
          v27 = v23;
          v29 = v24;
          v30 = v25;
          v31 = 1;
          WebCore::createLiveRange();
          v2 = kit(v38);
          v13 = v38;
          v38 = 0;
          if (v13)
          {
            if (*((_DWORD *)v13 + 2) == 1)
            {
              (*(void (**)(DOMObjectInternal *))(*(_QWORD *)v13 + 8))(v13);
              if (!v31)
              {
LABEL_51:
                v10 = v34;
                v9 = v32;
                if (!v34)
                  goto LABEL_60;
LABEL_52:
                v16 = (WTF *)((char *)v9 + 8 * v10);
                do
                {
                  while (1)
                  {
                    v17 = *(unsigned int **)v9;
                    *(_QWORD *)v9 = 0;
                    if (v17)
                    {
                      do
                      {
                        v18 = __ldaxr(v17);
                        v19 = v18 - 1;
                      }
                      while (__stlxr(v19, v17));
                      if (!v19)
                        break;
                    }
                    v9 = (WTF *)((char *)v9 + 8);
                    if (v9 == v16)
                      goto LABEL_59;
                  }
                  atomic_store(1u, v17);
                  WTF::fastFree((WTF *)v17, v8);
                  v9 = (WTF *)((char *)v9 + 8);
                }
                while (v9 != v16);
LABEL_59:
                v9 = v32;
                goto LABEL_60;
              }
LABEL_41:
              v14 = v29;
              v29 = 0;
              if (v14)
              {
                if (*((_DWORD *)v14 + 6) == 2)
                {
                  if ((*((_WORD *)v14 + 15) & 0x400) == 0)
                    WebCore::Node::removedLastRef(v14);
                }
                else
                {
                  *((_DWORD *)v14 + 6) -= 2;
                }
              }
              v15 = v26;
              v26 = 0;
              if (v15)
              {
                if (*((_DWORD *)v15 + 6) == 2)
                {
                  if ((*((_WORD *)v15 + 15) & 0x400) == 0)
                    WebCore::Node::removedLastRef(v15);
                }
                else
                {
                  *((_DWORD *)v15 + 6) -= 2;
                }
              }
              goto LABEL_51;
            }
            --*((_DWORD *)v13 + 2);
          }
          if (!v31)
            goto LABEL_51;
          goto LABEL_41;
        }
        v3 = v35[6];
LABEL_11:
        *((_DWORD *)v4 + 6) = v3 + 2;
        goto LABEL_12;
      }
      v3 = 2;
    }
    v4 = v2;
    goto LABEL_11;
  }
  return v2;
}

- (unint64_t)affinity
{
  WebCore::Node *v2;
  unsigned int v3;
  WebCore::Node *v5;
  unsigned __int8 v6;

  if (!self)
    return 0;
  -[WebVisiblePosition _visiblePosition](self, "_visiblePosition");
  v2 = v5;
  v3 = v6;
  v5 = 0;
  if (!v2)
    return v3;
  if (*((_DWORD *)v2 + 6) != 2)
  {
    *((_DWORD *)v2 + 6) -= 2;
    return v3;
  }
  if ((*((_WORD *)v2 + 15) & 0x400) != 0)
    return v3;
  WebCore::Node::removedLastRef(v2);
  return v3;
}

- (void)setAffinity:(unint64_t)a3
{
  *((_BYTE *)self->_internal + 16) = a3 != 0;
}

@end

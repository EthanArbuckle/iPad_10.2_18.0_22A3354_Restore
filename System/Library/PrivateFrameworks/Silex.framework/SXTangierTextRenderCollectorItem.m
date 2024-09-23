@implementation SXTangierTextRenderCollectorItem

- (id)initWithStorage:(void *)a3 layout:(void *)a4 directLayerHost:(char)a5 selectable:(void *)a6 componentIdentifier:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id *v16;
  objc_super v18;

  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)SXTangierTextRenderCollectorItem;
    v16 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = v16;
    if (v16)
    {
      objc_storeStrong(v16 + 3, a2);
      objc_storeStrong(a1 + 7, a3);
      objc_storeStrong(a1 + 6, a4);
      *((_BYTE *)a1 + 8) = a5;
      objc_storeStrong(a1 + 5, a6);
      *(int64x2_t *)(a1 + 9) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    }
  }

  return a1;
}

- (void)updateWithLayout:(uint64_t)a1
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a2;
  if (a1 && *(id *)(a1 + 56) != v4)
  {
    v8 = v4;
    objc_storeStrong((id *)(a1 + 56), a2);
    v5 = *(id *)(a1 + 64);
    objc_msgSend(v5, "layoutController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unregisterLayout:", *(_QWORD *)(a1 + 64));

    v7 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

    v4 = v8;
  }

}

- (void)appendToFlowStorage:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    v4 = objc_msgSend(v6, "length");
    objc_msgSend(v6, "insertStorage:atCharIndex:dolcContext:undoTransaction:", *(_QWORD *)(a1 + 24), v4, 0, 0);
    v5 = objc_msgSend(v6, "length");
    objc_storeStrong((id *)(a1 + 32), a2);
    *(_QWORD *)(a1 + 72) = v4;
    *(_QWORD *)(a1 + 80) = v5 - v4;
  }

}

- (uint64_t)storage
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (_QWORD)flowInfo
{
  _QWORD *v1;
  void *v2;
  SXTextTangierFlowInfo *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[2];
    if (!v2)
    {
      v3 = -[SXTextTangierFlowInfo initWithStorage:range:]([SXTextTangierFlowInfo alloc], "initWithStorage:range:", a1[4], a1[9], a1[10]);
      v4 = (void *)v1[2];
      v1[2] = v3;

      objc_msgSend((id)v1[2], "setDirectLayerHost:", v1[6]);
      v2 = (void *)v1[2];
    }
    a1 = v2;
  }
  return a1;
}

- (_QWORD)flowLayoutWithICC:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  BOOL v30;
  void *v31;
  SXTextTangierFlowLayout *v32;
  id v33;
  uint64_t v34;
  void *v35;
  CGRect v37;
  CGRect v38;

  v3 = a2;
  if (a1)
  {
    v4 = a1[8];
    v5 = (void *)a1[6];
    v6 = (id)a1[7];
    v7 = v5;
    objc_msgSend(v6, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v3, "canvasView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "convertRect:toView:", v16, v9, v11, v13, v15);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    if (v4)
    {
      objc_msgSend((id)a1[8], "geometry");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "frame");
      v38.origin.x = v26;
      v38.origin.y = v27;
      v38.size.width = v28;
      v38.size.height = v29;
      v37.origin.x = v18;
      v37.origin.y = v20;
      v37.size.width = v22;
      v37.size.height = v24;
      v30 = CGRectEqualToRect(v37, v38);

      if (v30)
      {
LABEL_7:
        a1 = (id)a1[8];
        goto LABEL_8;
      }
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3AA8]), "initWithFrame:", v18, v20, v22, v24);
      objc_msgSend((id)a1[8], "setGeometry:", v31);
    }
    else
    {
      v32 = [SXTextTangierFlowLayout alloc];
      -[SXTangierTextRenderCollectorItem flowInfo](a1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (id)a1[7];
      v34 = -[SXTextTangierFlowLayout initWithInfo:layout:frame:](v32, "initWithInfo:layout:frame:", v31, v33, v18, v20, v22, v24);
      v35 = (void *)a1[8];
      a1[8] = v34;

    }
    goto LABEL_7;
  }
LABEL_8:

  return a1;
}

- (uint64_t)directLayerHost
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSRange flowRange;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  if (self)
  {
    flowRange = self->_flowRange;
  }
  else
  {
    flowRange.length = 0;
    flowRange.location = 0;
  }
  NSStringFromRange(flowRange);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; flowRange: %@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)flowRange
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (uint64_t)componentIdentifier
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (BOOL)selectable
{
  if (result)
    return *(_BYTE *)(result + 8) != 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_directLayerHost, 0);
  objc_storeStrong((id *)&self->_componentIdentifier, 0);
  objc_storeStrong((id *)&self->_flowStorage, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_flowInfo, 0);
}

@end

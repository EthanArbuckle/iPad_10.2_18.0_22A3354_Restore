@implementation VKCBaseElement

- (int64_t)elementType
{
  return 0;
}

- (NSString)stringValue
{
  void *v2;
  void *v3;

  -[VKCBaseElement crOutputRegion](self, "crOutputRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CGRect)boundingBox
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[VKCBaseElement crOutputRegion](self, "crOutputRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boundingQuad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "boundingBox");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)imageSpaceBoundingBox
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[VKCBaseElement crOutputRegion](self, "crOutputRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boundingQuad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "denormalizedQuad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingBox");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (int)confidence
{
  void *v2;
  int v3;

  -[VKCBaseElement crOutputRegion](self, "crOutputRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "confidence");

  return v3;
}

- (int64_t)type
{
  void *v2;
  uint64_t v3;

  -[VKCBaseElement crOutputRegion](self, "crOutputRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  if (v3 == 2048)
    return 2;
  else
    return 1;
}

- (NSArray)children
{
  return 0;
}

- (BOOL)isInspectableCellSelectable
{
  return 0;
}

- (unint64_t)numberOfChildren
{
  void *v2;
  unint64_t v3;

  -[VKCBaseElement children](self, "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)hasChildren
{
  return -[VKCBaseElement numberOfChildren](self, "numberOfChildren") != 0;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  char v6;

  y = a3.y;
  x = a3.x;
  -[VKCBaseElement quad](self, "quad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsPoint:", x, y);

  return v6;
}

- (void)setCrOutputRegion:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_crOutputRegion, a3);
  v5 = a3;
  -[VKCBaseElement loadInfoFromCROutputRegion:](self, "loadInfoFromCROutputRegion:", v5);

}

- (void)loadInfoFromCROutputRegion:(id)a3
{
  id v4;
  VKQuad *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  VKQuad *v23;
  id v24;

  v4 = a3;
  v5 = [VKQuad alloc];
  objc_msgSend(v4, "boundingQuad");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomLeft");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v4, "boundingQuad");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomRight");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v4, "boundingQuad");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topLeft");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v4, "boundingQuad");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "topRight");
  v23 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:](v5, "initWithBottomLeft:bottomRight:topLeft:topRight:", v7, v9, v12, v14, v17, v19, v21, v22);
  -[VKCBaseElement setQuad:](self, "setQuad:", v23);

}

- (id)childAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[VKCBaseElement children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") <= a3)
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[VKCBaseElement childAtIndex:]", 0, 0, CFSTR("Trying to ask for a child of index: %ld, where only %ld children exist"), a3, objc_msgSend(v5, "count"));
    v7 = 0;
  }
  else
  {
    -[VKCBaseElement children](self, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)recursiveSearchForCROutputRegion:(id)a3
{
  id v4;
  void *v5;
  int v6;
  VKCBaseElement *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VKCBaseElement crOutputRegion](self, "crOutputRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (!v6 || (v7 = self) == 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[VKCBaseElement children](self, "children", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "recursiveSearchForCROutputRegion:", v4);
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v7 = (VKCBaseElement *)v13;
            goto LABEL_13;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          continue;
        break;
      }
    }
    v7 = 0;
LABEL_13:

  }
  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCBaseElement stringValue](self, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (VKCBaseElement)parent
{
  return (VKCBaseElement *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (CROutputRegion)crOutputRegion
{
  return self->_crOutputRegion;
}

- (CRDocumentOutputRegion)parentCRDocument
{
  return self->_parentCRDocument;
}

- (void)setParentCRDocument:(id)a3
{
  objc_storeStrong((id *)&self->_parentCRDocument, a3);
}

- (VKQuad)quad
{
  return self->_quad;
}

- (void)setQuad:(id)a3
{
  objc_storeStrong((id *)&self->_quad, a3);
}

- (NSArray)components
{
  return self->_components;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_parentCRDocument, 0);
  objc_storeStrong((id *)&self->_crOutputRegion, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end

@implementation CRFormDetectorModelOutput

- (CRFormDetectorModelOutput)initWithBoundingBoxes:(id)a3 classLogits:(id)a4 anchors:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRFormDetectorModelOutput *v12;
  CRFormDetectorModelOutput *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRFormDetectorModelOutput;
  v12 = -[CRFormDetectorModelOutput init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_boundingBoxes, a3);
    objc_storeStrong((id *)&v13->_classLogits, a4);
    objc_storeStrong((id *)&v13->_anchors, a5);
  }

  return v13;
}

- (NSSet)featureNames
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("bbox_regression");
  v6[1] = CFSTR("cls_logits");
  v6[2] = CFSTR("anchors");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("bbox_regression")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[CRFormDetectorModelOutput boundingBoxes](self, "boundingBoxes");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("cls_logits")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[CRFormDetectorModelOutput classLogits](self, "classLogits");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("anchors")))
    {
      v8 = 0;
      goto LABEL_8;
    }
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[CRFormDetectorModelOutput anchors](self, "anchors");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "featureValueWithMultiArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v8;
}

- (MLMultiArray)boundingBoxes
{
  return self->_boundingBoxes;
}

- (void)setBoundingBoxes:(id)a3
{
  objc_storeStrong((id *)&self->_boundingBoxes, a3);
}

- (MLMultiArray)classLogits
{
  return self->_classLogits;
}

- (void)setClassLogits:(id)a3
{
  objc_storeStrong((id *)&self->_classLogits, a3);
}

- (MLMultiArray)anchors
{
  return self->_anchors;
}

- (void)setAnchors:(id)a3
{
  objc_storeStrong((id *)&self->_anchors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchors, 0);
  objc_storeStrong((id *)&self->_classLogits, 0);
  objc_storeStrong((id *)&self->_boundingBoxes, 0);
}

@end

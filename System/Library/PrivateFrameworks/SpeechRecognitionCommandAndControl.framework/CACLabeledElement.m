@implementation CACLabeledElement

- (NSString)unfilteredRecognitionLabel
{
  void *v2;
  void *v3;

  -[CACLabeledElement element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speechInputLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)fullLabel
{
  void *v2;
  void *v3;

  -[CACLabeledElement element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)valueLabel
{
  void *v2;
  void *v3;

  -[CACLabeledElement element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)traits
{
  void *v2;
  unint64_t v3;

  -[CACLabeledElement element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "traits");

  return v3;
}

- (CGRect)frame
{
  void *v2;
  double v3;
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
  CGRect result;

  -[CACLabeledElement element](self, "element");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CACLabeledElement)initWithElement:(id)a3 recognitionStrings:(id)a4 rectangle:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  CACLabeledElement *v13;
  CACLabeledElement *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  objc_super v39;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CACLabeledElement;
  v13 = -[CACLabeledElement init](&v39, sel_init);
  v14 = v13;
  if (v13)
  {
    -[CACLabeledElement setElement:](v13, "setElement:", v11);
    -[CACLabeledElement setRecognitionStrings:](v14, "setRecognitionStrings:", v12);
    -[CACLabeledElement setRectangle:](v14, "setRectangle:", x, y, width, height);
    objc_msgSend(v11, "uiElement");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithAXAttribute:", 5019);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACLabeledElement setAxIdentifier:](v14, "setAxIdentifier:", v16);

    v14->_displayID = objc_msgSend(v11, "windowDisplayId");
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "overlayViewForDisplayID:", v14->_displayID);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "carPlayConnected");

    objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20)
    {
      objc_msgSend(v21, "elementsForAttribute:", 1009);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "firstObject");
      v24 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v24;
    }
    -[CACLabeledElement rectangle](v14, "rectangle");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    objc_msgSend(v18, "window");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "convertRect:toContextId:displayId:", objc_msgSend(v33, "_contextId"), v14->_displayID, v26, v28, v30, v32);
    v14->_interfaceRectangle.origin.x = v34;
    v14->_interfaceRectangle.origin.y = v35;
    v14->_interfaceRectangle.size.width = v36;
    v14->_interfaceRectangle.size.height = v37;

  }
  return v14;
}

- (NSString)label
{
  return (NSString *)-[NSArray firstObject](self->_recognitionStrings, "firstObject");
}

- (CGPoint)quantizedPosition
{
  float v2;
  double v3;
  float v4;
  double v5;
  CGPoint result;

  v2 = self->_rectangle.origin.x / 10.0;
  v3 = truncf(v2);
  v4 = (self->_rectangle.origin.y + self->_rectangle.size.height) / 10.0;
  v5 = truncf(v4);
  result.y = v5;
  result.x = v3;
  return result;
}

- (int64_t)quantizedPositionCompare:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  -[CACLabeledElement quantizedPosition](self, "quantizedPosition");
  v6 = v5;
  -[CACLabeledElement quantizedPosition](self, "quantizedPosition");
  v8 = v6 + v7 / 1000.0;
  objc_msgSend(v4, "quantizedPosition");
  v10 = v9;
  objc_msgSend(v4, "quantizedPosition");
  v12 = v11;

  if (v8 >= v10 + v12 / 1000.0)
    return 1;
  else
    return -1;
}

- (CGRect)interfaceOrientedRectangle
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_interfaceRectangle.origin.x;
  y = self->_interfaceRectangle.origin.y;
  width = self->_interfaceRectangle.size.width;
  height = self->_interfaceRectangle.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Labeled element: %@, %@, label:(%f,%f,%f,%f), elmt:(%f,%f,%f,%f), %@"), self->_recognitionStrings, self->_numberedLabel, *(_QWORD *)&self->_labelRectangle.origin.x, *(_QWORD *)&self->_labelRectangle.origin.y, *(_QWORD *)&self->_labelRectangle.size.width, *(_QWORD *)&self->_labelRectangle.size.height, *(_QWORD *)&self->_rectangle.origin.x, *(_QWORD *)&self->_rectangle.origin.y, *(_QWORD *)&self->_rectangle.size.width, *(_QWORD *)&self->_rectangle.size.height, self->_element);
}

- (AXElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
  objc_storeStrong((id *)&self->_element, a3);
}

- (NSArray)recognitionStrings
{
  return self->_recognitionStrings;
}

- (void)setRecognitionStrings:(id)a3
{
  objc_storeStrong((id *)&self->_recognitionStrings, a3);
}

- (NSString)numberedLabel
{
  return self->_numberedLabel;
}

- (void)setNumberedLabel:(id)a3
{
  objc_storeStrong((id *)&self->_numberedLabel, a3);
}

- (CACTextMarkerRange)textMarkerRange
{
  return self->_textMarkerRange;
}

- (void)setTextMarkerRange:(id)a3
{
  objc_storeStrong((id *)&self->_textMarkerRange, a3);
}

- (CGRect)rectangle
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rectangle.origin.x;
  y = self->_rectangle.origin.y;
  width = self->_rectangle.size.width;
  height = self->_rectangle.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRectangle:(CGRect)a3
{
  self->_rectangle = a3;
}

- (CGRect)labelRectangle
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_labelRectangle.origin.x;
  y = self->_labelRectangle.origin.y;
  width = self->_labelRectangle.size.width;
  height = self->_labelRectangle.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLabelRectangle:(CGRect)a3
{
  self->_labelRectangle = a3;
}

- (BOOL)hasBeenCollected
{
  return self->_hasBeenCollected;
}

- (void)setHasBeenCollected:(BOOL)a3
{
  self->_hasBeenCollected = a3;
}

- (NSString)axIdentifier
{
  return self->_axIdentifier;
}

- (void)setAxIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_axIdentifier, a3);
}

- (int64_t)arrowOrientation
{
  return self->_arrowOrientation;
}

- (void)setArrowOrientation:(int64_t)a3
{
  self->_arrowOrientation = a3;
}

- (int64_t)badgePresentation
{
  return self->_badgePresentation;
}

- (void)setBadgePresentation:(int64_t)a3
{
  self->_badgePresentation = a3;
}

- (int64_t)badgeIndicatorMask
{
  return self->_badgeIndicatorMask;
}

- (void)setBadgeIndicatorMask:(int64_t)a3
{
  self->_badgeIndicatorMask = a3;
}

- (unsigned)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(unsigned int)a3
{
  self->_displayID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textMarkerRange, 0);
  objc_storeStrong((id *)&self->_axIdentifier, 0);
  objc_storeStrong((id *)&self->_numberedLabel, 0);
  objc_storeStrong((id *)&self->_recognitionStrings, 0);
  objc_storeStrong((id *)&self->_element, 0);
}

- (CGSize)elementLabelContainerSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)isSpacer
{
  return 0;
}

@end

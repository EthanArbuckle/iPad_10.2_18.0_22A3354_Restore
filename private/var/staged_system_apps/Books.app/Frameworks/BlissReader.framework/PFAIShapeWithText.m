@implementation PFAIShapeWithText

- (void)updateLineHintsWithShape:(id)a3 readerState:(id)a4
{
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v6 = objc_opt_class(PFAIContentState);
  *(_QWORD *)&v7 = TSUDynamicCast(v6, a4).n128_u64[0];
  v9 = v8;
  if (objc_msgSend(v8, "paginatedIsCurrent", v7))
  {
    v10 = objc_msgSend(objc_msgSend(v9, "currentStackEntry"), "paginatedState");
    objc_msgSend(a3, "setLineHints:", +[PFAIDrawablePlacement lineHintsForPropertySet:textStorage:contentState:](PFAIDrawablePlacement, "lineHintsForPropertySet:textStorage:contentState:", objc_msgSend(v10, "propertySet"), objc_msgSend(v10, "storage"), v9));
  }
}

@end

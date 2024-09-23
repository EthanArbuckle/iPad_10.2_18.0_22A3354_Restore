@implementation TSTCellAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTCell");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

+ (void)tsaxAccessModelForCellAtColumnIndex:(unint64_t)a3 rowIndex:(unint64_t)a4 tableModel:(id)a5 accessController:(id)a6 usingBlock:(id)a7
{
  unint64_t v10;
  id v11;

  v10 = (unsigned __int16)a4 | ((unint64_t)a3 << 16);
  v11 = (id)objc_opt_new(TSTCell, a2);
  TSTCellAtCellIDHoldingReadLock(a5, v10, v11, a6);
  (*((void (**)(id))a7 + 2))(a7);

}

- (BOOL)tsaxBoolValue
{
  objc_class *v3;
  uint64_t v4;
  uint64_t v5;
  char v7;

  v7 = 0;
  v3 = (objc_class *)objc_opt_class(TSTCell);
  v4 = __TSAccessibilityCastAsClass(v3, (uint64_t)self, 1, &v7);
  if (v7)
    abort();
  if (v4)
  {
    v5 = v4 + OBJC_IVAR___TSTCell_mPrivate;
    if (*(_BYTE *)(v5 + 1))
    {
      if (*(_BYTE *)(v5 + 1) == 6)
        return *(double *)(v5 + 8) != 0.0;
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "BOOL TSTCellBoolValue(TSTCell *)"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/AppleInternal/Library/BuildRoots/ae269ea5-5122-11ef-a621-12147c76fa9d/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.0.Internal.sdk/usr/local/include/TSFrameworks/TSTables/TSTCell.h"), 925, CFSTR("can't get BOOL value from non-BOOL cell: %p"), v4);
    }
  }
  return 0;
}

- (double)tsaxDoubleValue
{
  objc_class *v3;
  uint64_t v4;
  uint64_t v5;
  double v7;
  char v9;

  v9 = 0;
  v3 = (objc_class *)objc_opt_class(TSTCell);
  v4 = __TSAccessibilityCastAsClass(v3, (uint64_t)self, 1, &v9);
  if (v9)
    abort();
  if (v4)
  {
    v5 = v4 + OBJC_IVAR___TSTCell_mPrivate;
    if ((*(_DWORD *)v5 & 0xFB00) == 0x200 || BYTE1(*(_DWORD *)v5) == 7)
    {
      return *(double *)(v5 + 8);
    }
    else
    {
      v7 = 0.0;
      if (BYTE1(*(_DWORD *)v5))
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "double TSTCellDoubleValue(TSTCell *)"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/AppleInternal/Library/BuildRoots/ae269ea5-5122-11ef-a621-12147c76fa9d/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.0.Internal.sdk/usr/local/include/TSFrameworks/TSTables/TSTCell.h"), 897, CFSTR("can't get value from non-value cell: %p"), v4);
    }
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "double TSTCellDoubleValue(TSTCell *)"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/AppleInternal/Library/BuildRoots/ae269ea5-5122-11ef-a621-12147c76fa9d/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.0.Internal.sdk/usr/local/include/TSFrameworks/TSTables/TSTCell.h"), 889, CFSTR("invalid nil value for '%s'"), "cell");
    return 0.0;
  }
  return v7;
}

- (NSString)tsaxSelectedMultipleChoiceValueDescription
{
  return 0;
}

- (BOOL)tsaxHasFormula
{
  return 0;
}

- (BOOL)tsaxHasFormulaError
{
  return 0;
}

@end

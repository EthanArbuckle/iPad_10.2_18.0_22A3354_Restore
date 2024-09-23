@implementation _PXWidgetCompositionElementScanner

- (BOOL)isAtEnd
{
  unint64_t scanLocation;
  void *v3;

  scanLocation = self->_scanLocation;
  -[_PXWidgetCompositionElementScanner elements](self, "elements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(scanLocation) = scanLocation >= objc_msgSend(v3, "count");

  return scanLocation;
}

- (BOOL)scanRow:(id *)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  NSUInteger length;
  NSUInteger v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v14;

  self->_scannedRowRange.location = self->_scanLocation;
  self->_scannedRowRange.length = 0;
  if (!-[_PXWidgetCompositionElementScanner isAtEnd](self, "isAtEnd"))
  {
    -[_PXWidgetCompositionElementScanner elements](self, "elements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_scannedRowRange.length = 1;
    objc_msgSend(v5, "objectAtIndexedSubscript:", self->_scannedRowRange.location);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[_PXWidgetCompositionElementScanner _wantsEdgeToEdgeLayoutForElement:](self, "_wantsEdgeToEdgeLayoutForElement:", v6))
    {
      v7 = objc_msgSend(v5, "count");
      v8 = -[_PXWidgetCompositionElementScanner maximumNumberOfColumns](self, "maximumNumberOfColumns");
      length = self->_scannedRowRange.length;
      if (length + self->_scannedRowRange.location < v7)
      {
        v10 = v8;
        if (length < v8)
        {
          while (1)
          {
            objc_msgSend(v5, "objectAtIndexedSubscript:");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[_PXWidgetCompositionElementScanner _wantsEdgeToEdgeLayoutForElement:](self, "_wantsEdgeToEdgeLayoutForElement:", v11))
            {
              break;
            }
            ++self->_scannedRowRange.length;

            v12 = self->_scannedRowRange.length;
            if (v12 + self->_scannedRowRange.location >= v7 || v12 >= v10)
              goto LABEL_13;
          }

        }
      }
    }
LABEL_13:

  }
  v14 = self->_scannedRowRange.length;
  if (v14)
  {
    self->_scanLocation = self->_scannedRowRange.location + v14;
    if (a3)
      *a3 = objc_retainAutorelease(self);
  }
  return v14 != 0;
}

- (BOOL)_wantsEdgeToEdgeLayoutForElement:(id)a3
{
  id v4;
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  char v7;

  v4 = a3;
  -[_PXWidgetCompositionElementScanner wantsEdgeToEdgeLayoutBlock](self, "wantsEdgeToEdgeLayoutBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_PXWidgetCompositionElementScanner wantsEdgeToEdgeLayoutBlock](self, "wantsEdgeToEdgeLayoutBlock");
    v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = ((uint64_t (**)(_QWORD, id))v6)[2](v6, v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)numberOfColumns
{
  return self->_scannedRowRange.length;
}

- (void)enumerateElementsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  double v19;
  _QWORD v20[6];
  _QWORD v21[4];

  v4 = a3;
  -[_PXWidgetCompositionElementScanner elements](self, "elements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", self->_scannedRowRange.location, self->_scannedRowRange.length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PXWidgetCompositionElementScanner referenceWidth](self, "referenceWidth");
  v9 = v8;
  -[_PXWidgetCompositionElementScanner interColumnSpacing](self, "interColumnSpacing");
  v11 = (v9 + v10) / (double)(unint64_t)objc_msgSend(v7, "count");
  -[_PXWidgetCompositionElementScanner interColumnSpacing](self, "interColumnSpacing");
  v13 = v11 - v12;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66___PXWidgetCompositionElementScanner_enumerateElementsUsingBlock___block_invoke;
  v20[3] = &unk_1E51299D0;
  *(double *)&v20[5] = v13;
  v20[4] = v21;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v20);
  v16[0] = v14;
  v16[1] = 3221225472;
  v16[2] = __66___PXWidgetCompositionElementScanner_enumerateElementsUsingBlock___block_invoke_2;
  v16[3] = &unk_1E51299F8;
  v19 = v13;
  v18 = v21;
  v15 = v4;
  v17 = v15;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v16);

  _Block_object_dispose(v21, 8);
}

- (NSArray)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)wantsEdgeToEdgeLayoutBlock
{
  return self->_wantsEdgeToEdgeLayoutBlock;
}

- (void)setWantsEdgeToEdgeLayoutBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)referenceWidth
{
  return self->_referenceWidth;
}

- (void)setReferenceWidth:(double)a3
{
  self->_referenceWidth = a3;
}

- (double)interColumnSpacing
{
  return self->_interColumnSpacing;
}

- (void)setInterColumnSpacing:(double)a3
{
  self->_interColumnSpacing = a3;
}

- (int64_t)maximumNumberOfColumns
{
  return self->_maximumNumberOfColumns;
}

- (void)setMaximumNumberOfColumns:(int64_t)a3
{
  self->_maximumNumberOfColumns = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_wantsEdgeToEdgeLayoutBlock, 0);
  objc_storeStrong((id *)&self->_elements, 0);
}

@end

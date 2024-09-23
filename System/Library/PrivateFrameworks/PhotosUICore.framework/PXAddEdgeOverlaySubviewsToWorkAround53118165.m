@implementation PXAddEdgeOverlaySubviewsToWorkAround53118165

void __PXAddEdgeOverlaySubviewsToWorkAround53118165_block_invoke(uint64_t a1, int a2)
{
  PXGradientView *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(PXGradientView);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v18[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGradientView setColors:](v4, "setColors:", v8);

  v9 = *(double *)(a1 + 48);
  PXRectEdgeValue();
  v11 = v10 + -4.0;
  v12 = *(double *)(a1 + 64);
  v13 = 0.625;
  v14 = -1.5;
  v15 = 34;
  switch(a2)
  {
    case 0:
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 34);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<UIView *> * _Nullable PXAddEdgeOverlaySubviewsToWorkAround53118165(UIView *__strong _Nonnull, CGRect)_block_invoke");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PX53118165Workaround.m"), 45, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      goto LABEL_3;
    case 3:
      v13 = 0.375;
      v6 = 1.0;
      v15 = 10;
      v14 = 1.5;
LABEL_3:
      -[PXGradientView setAutoresizingMask:](v4, "setAutoresizingMask:", v15);
      v11 = v11 + v14;
      -[PXGradientView setStartPoint:](v4, "setStartPoint:", 0.5, v6);
      -[PXGradientView setEndPoint:](v4, "setEndPoint:", 0.5, v13);
      break;
    default:
      break;
  }
  -[PXGradientView setFrame:](v4, "setFrame:", v15, v9, v11, v12, 8.0);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v4);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

@end

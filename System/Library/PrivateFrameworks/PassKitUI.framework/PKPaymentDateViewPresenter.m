@implementation PKPaymentDateViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  _BOOL8 v7;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v7 = a5;
  v26 = a3;
  v9 = a4;
  objc_msgSend(v26, "setShowsDisclosure:", 0);
  objc_msgSend(v26, "setSelectionStyle:", 0);
  objc_msgSend(v26, "setShowsSeparator:", v7);
  v10 = v9;
  v11 = objc_msgSend(v10, "paymentFrequency");
  if (qword_1ED06C858 != -1)
    dispatch_once(&qword_1ED06C858, &__block_literal_global_228);
  v12 = (void *)_MergedGlobals_689;
  objc_msgSend(v10, "paymentTimeZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimeZone:", v13);

  v14 = (void *)_MergedGlobals_689;
  objc_msgSend(v10, "paymentDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringFromDate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  switch(v11)
  {
    case 0:
    case 1:
    case 3:
      v17 = 0;
      v18 = 0;
      v19 = &stru_1E3E7D690;
      break;
    case 2:
      PKLocalizedFeatureString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v16;
      goto LABEL_14;
    case 4:
      goto LABEL_9;
    case 5:
      goto LABEL_8;
    case 6:
      PKLocalizedFeatureString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
LABEL_8:
        PKLocalizedFeatureString();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
LABEL_9:
          PKLocalizedFeatureString();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      PKLocalizedFeatureString();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      PKStringWithValidatedFormat();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n(%@)"), v18, v22);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v17)
        goto LABEL_11;
      break;
    case 7:
      PKLocalizedFeatureString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      v19 = v20;
      v18 = 0;
      if (!v17)
        break;
LABEL_11:
      objc_msgSend(v17, "pk_uppercaseAttributedString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setLabel:", v23);

      objc_msgSend(v26, "setAccessibilityLabel:", v17);
      break;
    default:
      v17 = 0;
      v19 = 0;
      v18 = 0;
      break;
  }
  -[__CFString pk_uppercaseAttributedString](v19, "pk_uppercaseAttributedString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addValue:type:", v24, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setNumberOfLines:", 2);
}

uint64_t __106__PKPaymentDateViewPresenter_presentCell_withDataItem_shouldShowSeperator_forPaymentRequest_cellProvider___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_689;
  _MergedGlobals_689 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_689, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d, yyyy"));
}

@end

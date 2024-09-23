@implementation StockDataFormatter

+ (id)sharedDataFormatter
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__StockDataFormatter_sharedDataFormatter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDataFormatter_onceToken != -1)
    dispatch_once(&sharedDataFormatter_onceToken, block);
  return (id)sharedDataFormatter_instance;
}

void __41__StockDataFormatter_sharedDataFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initPrivate");
  v1 = (void *)sharedDataFormatter_instance;
  sharedDataFormatter_instance = v0;

}

- (id)initPrivate
{
  StockDataFormatter *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *decimalFormatterQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *percentFormatterQueue;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)StockDataFormatter;
  v2 = -[StockDataFormatter init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.stocks.stock-decimal-formatter-queue", 0);
    decimalFormatterQueue = v2->_decimalFormatterQueue;
    v2->_decimalFormatterQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.stocks.stock-percent-formatter-queue", 0);
    percentFormatterQueue = v2->_percentFormatterQueue;
    v2->_percentFormatterQueue = (OS_dispatch_queue *)v5;

    -[StockDataFormatter _resetLocale:](v2, "_resetLocale:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__resetLocale_, *MEMORY[0x24BDBCA70], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)StockDataFormatter;
  -[StockDataFormatter dealloc](&v4, sel_dealloc);
}

- (id)formattedChangeInPercentForStock:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  float v9;
  float v10;
  double v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "change");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  objc_msgSend(v4, "price");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "floatValue");
  v10 = v9;

  *(float *)&v11 = v10 - v7;
  if ((float)(v10 - v7) == 0.0)
  {
    +[Stock BlankValueString](Stock, "BlankValueString", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *(float *)&v11 = fabsf(v7 / *(float *)&v11);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockDataFormatter formattedPercent:](self, "formattedPercent:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)formattedChangeInPointsForStock:(id)a3 withPrecision:(unint64_t)a4
{
  return -[StockDataFormatter formattedChangeInPointsForStock:withPrecision:droppingFractionDigitsIfLengthExceeds:](self, "formattedChangeInPointsForStock:withPrecision:droppingFractionDigitsIfLengthExceeds:", a3, a4, -1);
}

- (id)formattedChangeInPointsForStock:(id)a3 withPrecision:(unint64_t)a4 droppingFractionDigitsIfLengthExceeds:(unint64_t)a5
{
  void *v8;
  float v9;
  float v10;
  double v11;
  void *v12;
  void *v13;

  objc_msgSend(a3, "change");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  *(float *)&v11 = fabsf(v10);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockDataFormatter formattedNumber:withPrecision:useGroupSeparator:droppingFractionDigitsIfLengthExceeds:](self, "formattedNumber:withPrecision:useGroupSeparator:droppingFractionDigitsIfLengthExceeds:", v12, a4, 1, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)formattedPriceForStock:(id)a3 withPrecision:(unint64_t)a4
{
  return -[StockDataFormatter formattedPriceForStock:withPrecision:droppingFractionDigitsIfLengthExceeds:](self, "formattedPriceForStock:withPrecision:droppingFractionDigitsIfLengthExceeds:", a3, a4, -1);
}

- (id)formattedPriceForStock:(id)a3 withPrecision:(unint64_t)a4 droppingFractionDigitsIfLengthExceeds:(unint64_t)a5
{
  void *v8;
  int v9;
  int v10;
  double v11;
  void *v12;
  void *v13;

  objc_msgSend(a3, "price");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  LODWORD(v11) = v10;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockDataFormatter formattedNumber:withPrecision:useGroupSeparator:droppingFractionDigitsIfLengthExceeds:](self, "formattedNumber:withPrecision:useGroupSeparator:droppingFractionDigitsIfLengthExceeds:", v12, a4, 1, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)formattedNumber:(id)a3 withPrecision:(unint64_t)a4 useGroupSeparator:(BOOL)a5
{
  return -[StockDataFormatter formattedNumber:withPrecision:useGroupSeparator:droppingFractionDigitsIfLengthExceeds:](self, "formattedNumber:withPrecision:useGroupSeparator:droppingFractionDigitsIfLengthExceeds:", a3, a4, a5, -1);
}

- (id)formattedNumber:(id)a3 withPrecision:(unint64_t)a4 useGroupSeparator:(BOOL)a5 droppingFractionDigitsIfLengthExceeds:(unint64_t)a6
{
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v10 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  -[StockDataFormatter decimalFormatterQueue](self, "decimalFormatterQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __108__StockDataFormatter_formattedNumber_withPrecision_useGroupSeparator_droppingFractionDigitsIfLengthExceeds___block_invoke;
  v15[3] = &unk_24D74B748;
  v15[4] = self;
  v16 = v10;
  v17 = &v21;
  v18 = a4;
  v20 = a5;
  v19 = a6;
  v12 = v10;
  dispatch_sync(v11, v15);

  v13 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v13;
}

void __108__StockDataFormatter_formattedNumber_withPrecision_useGroupSeparator_droppingFractionDigitsIfLengthExceeds___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_locked_formatNumber:withPrecision:useGroupSeparator:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length") > *(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "_locked_formatNumber:withPrecision:useGroupSeparator:", *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 72));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (id)formattedPercent:(id)a3
{
  return -[StockDataFormatter formattedPercent:withPrecision:](self, "formattedPercent:withPrecision:", a3, 2);
}

- (id)formattedPercent:(id)a3 withPrecision:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  -[StockDataFormatter percentFormatterQueue](self, "percentFormatterQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__StockDataFormatter_formattedPercent_withPrecision___block_invoke;
  v11[3] = &unk_24D74B770;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a4;
  v8 = v6;
  dispatch_sync(v7, v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __53__StockDataFormatter_formattedPercent_withPrecision___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_locked_formatPercent:withPrecision:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_locked_formatNumber:(id)a3 withPrecision:(unint64_t)a4 useGroupSeparator:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = a5;
  v8 = a3;
  -[StockDataFormatter decimalFormatter](self, "decimalFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMaximumFractionDigits:", a4);

  -[StockDataFormatter decimalFormatter](self, "decimalFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMinimumFractionDigits:", a4);

  -[StockDataFormatter decimalFormatter](self, "decimalFormatter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUsesGroupingSeparator:", v5);

  -[StockDataFormatter decimalFormatter](self, "decimalFormatter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromNumber:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v14, "textAttachmentDirectionIsRightToLeft");

  if ((_DWORD)v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C%@"), 8207, v13);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
  }
  return v13;
}

- (id)_locked_formatPercent:(id)a3 withPrecision:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[StockDataFormatter percentFormatter](self, "percentFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaximumFractionDigits:", a4);

  -[StockDataFormatter percentFormatter](self, "percentFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMinimumFractionDigits:", a4);

  -[StockDataFormatter percentFormatter](self, "percentFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromNumber:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_resetLocale:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD block[5];

  -[StockDataFormatter decimalFormatterQueue](self, "decimalFormatterQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__StockDataFormatter__resetLocale___block_invoke;
  block[3] = &unk_24D74B7C0;
  block[4] = self;
  dispatch_async(v4, block);

  -[StockDataFormatter percentFormatterQueue](self, "percentFormatterQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __35__StockDataFormatter__resetLocale___block_invoke_2;
  v7[3] = &unk_24D74B7C0;
  v7[4] = self;
  dispatch_async(v6, v7);

}

void __35__StockDataFormatter__resetLocale___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  char v4;
  _QWORD v5[5];
  char v6;

  v2 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v2, "setNumberStyle:", 1);
  objc_msgSend(v2, "setMinimumIntegerDigits:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setDecimalFormatter:", v2);

  objc_msgSend(*(id *)(a1 + 32), "_locked_formatNumber:withPrecision:useGroupSeparator:", &unk_24D75EFF8, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(CFSTR("1234567890"), "isEqualToString:", v3);

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__StockDataFormatter__resetLocale___block_invoke_26;
  v5[3] = &unk_24D74B798;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
}

uint64_t __35__StockDataFormatter__resetLocale___block_invoke_26(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(result + 40);
  return result;
}

void __35__StockDataFormatter__resetLocale___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v2, "setNumberStyle:", 3);
  objc_msgSend(v2, "setMinimumIntegerDigits:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setPercentFormatter:", v2);

}

- (NSString)percentSymbol
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[StockDataFormatter percentFormatterQueue](self, "percentFormatterQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__StockDataFormatter_percentSymbol__block_invoke;
  v6[3] = &unk_24D74B7E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __35__StockDataFormatter_percentSymbol__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "percentFormatter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "percentSymbol");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)doesLocaleUseASCII
{
  return self->_localeUsesASCII;
}

- (OS_dispatch_queue)decimalFormatterQueue
{
  return self->_decimalFormatterQueue;
}

- (void)setDecimalFormatterQueue:(id)a3
{
  objc_storeStrong((id *)&self->_decimalFormatterQueue, a3);
}

- (NSNumberFormatter)decimalFormatter
{
  return self->_decimalFormatter;
}

- (void)setDecimalFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_decimalFormatter, a3);
}

- (OS_dispatch_queue)percentFormatterQueue
{
  return self->_percentFormatterQueue;
}

- (void)setPercentFormatterQueue:(id)a3
{
  objc_storeStrong((id *)&self->_percentFormatterQueue, a3);
}

- (NSNumberFormatter)percentFormatter
{
  return self->_percentFormatter;
}

- (void)setPercentFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_percentFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentFormatter, 0);
  objc_storeStrong((id *)&self->_percentFormatterQueue, 0);
  objc_storeStrong((id *)&self->_decimalFormatter, 0);
  objc_storeStrong((id *)&self->_decimalFormatterQueue, 0);
}

@end

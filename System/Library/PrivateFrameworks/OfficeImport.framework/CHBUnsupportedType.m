@implementation CHBUnsupportedType

+ (id)chdChartTypeWithState:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  v5 = objc_msgSend(v3, "xlCurrentPlot");
  if (v5 && (*(unsigned int (**)(uint64_t))(*(_QWORD *)v5 + 16))(v5) - 6 < 3)
    v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "chart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chartTypeWithChart:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end

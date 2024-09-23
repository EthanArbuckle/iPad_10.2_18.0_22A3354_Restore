@implementation WFParameterStateProcessingContext

- (WFParameterStateProcessingContext)initWithVariableSource:(id)a3 parameter:(id)a4 isInputParameter:(BOOL)a5 environment:(int64_t)a6 contentAttributionTracker:(id)a7 widgetSizeClass:(id)a8
{
  id v15;
  id v16;
  id v17;
  WFParameterStateProcessingContext *v18;
  WFParameterStateProcessingContext *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  WFParameterStateProcessingContext *v24;
  void *v26;
  void *v27;
  id v29;
  objc_super v30;

  v29 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFParameterStateProcessingContext.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameter"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFParameterStateProcessingContext.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentAttributionTracker"));

LABEL_3:
  v30.receiver = self;
  v30.super_class = (Class)WFParameterStateProcessingContext;
  v18 = -[WFParameterStateProcessingContext init](&v30, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_variableSource, a3);
    objc_storeStrong((id *)&v19->_parameter, a4);
    v19->_isInputParameter = a5;
    v19->_environment = a6;
    objc_storeStrong((id *)&v19->_contentAttributionTracker, a7);
    objc_storeStrong((id *)&v19->_widgetSizeClass, a8);
    if (objc_msgSend(v15, "allowsMultipleValues"))
    {
      v20 = objc_msgSend(v15, "isRangedSizeArray");
      v21 = 0x7FFFFFFFFFFFFFFFLL;
      if (v17 && v20)
      {
        v22 = objc_msgSend(v15, "arraySizeRangeForWidgetFamily:", v17);
        v21 = v23 + v22 - 1;
      }
    }
    else
    {
      v21 = 1;
    }
    v19->_maximumItemCount = v21;
    v24 = v19;
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSizeClass, 0);
  objc_storeStrong((id *)&self->_contentAttributionTracker, 0);
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_variableSource, 0);
}

- (void)addContentAttributionSet:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFParameterStateProcessingContext contentAttributionTracker](self, "contentAttributionTracker");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WFParameterStateProcessingContext parameter](self, "parameter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAttributionSet:forParameter:", v4, v5);

}

- (WFVariableDataSource)variableSource
{
  return self->_variableSource;
}

- (WFParameter)parameter
{
  return self->_parameter;
}

- (BOOL)isInputParameter
{
  return self->_isInputParameter;
}

- (int64_t)environment
{
  return self->_environment;
}

- (WFContentAttributionTracker)contentAttributionTracker
{
  return self->_contentAttributionTracker;
}

- (NSString)widgetSizeClass
{
  return self->_widgetSizeClass;
}

- (int64_t)maximumItemCount
{
  return self->_maximumItemCount;
}

@end

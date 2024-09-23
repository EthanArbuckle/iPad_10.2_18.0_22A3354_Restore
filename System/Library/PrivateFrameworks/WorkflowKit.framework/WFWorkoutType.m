@implementation WFWorkoutType

- (WFWorkoutType)initWithActivityType:(unint64_t)a3
{
  WFWorkoutType *v4;
  WFWorkoutType *v5;
  uint64_t v6;
  NSString *name;
  WFWorkoutType *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFWorkoutType;
  v4 = -[WFWorkoutType init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_activityType = a3;
    softLinkHKUILocalizedWorkoutTypeName(a3);
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)allTypes
{
  void *v2;
  void *v3;
  void *v4;

  -[objc_class _allWorkoutActivityTypes](getHKWorkoutClass(), "_allWorkoutActivityTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_map:", &__block_literal_global_3561);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_289);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __25__WFWorkoutType_allTypes__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

WFWorkoutType *__25__WFWorkoutType_allTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFWorkoutType *v3;
  uint64_t v4;

  v2 = a2;
  v3 = [WFWorkoutType alloc];
  v4 = objc_msgSend(v2, "unsignedIntegerValue");

  return -[WFWorkoutType initWithActivityType:](v3, "initWithActivityType:", v4);
}

@end

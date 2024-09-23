@implementation _TUIElementAXActionsActionObjectBuilder

- (void)setActionData:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *arguments;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  arguments = self->_arguments;
  if (!arguments)
  {
    v8 = objc_opt_new(NSMutableDictionary);
    v9 = self->_arguments;
    self->_arguments = v8;

    arguments = self->_arguments;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](arguments, "setObject:forKeyedSubscript:", v10, v6);

}

- (NSString)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)refId
{
  return self->_refId;
}

- (void)setRefId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void)setIsDefault:(BOOL)a3
{
  self->_isDefault = a3;
}

- (NSMutableDictionary)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
  objc_storeStrong((id *)&self->_arguments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_refId, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
}

@end

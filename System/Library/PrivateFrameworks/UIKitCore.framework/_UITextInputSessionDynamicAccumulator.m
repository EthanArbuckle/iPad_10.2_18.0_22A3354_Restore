@implementation _UITextInputSessionDynamicAccumulator

+ (id)accumulatorWithName:(id)a3 depthRange:(_NSRange)a4 block:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  length = a4.length;
  location = a4.location;
  v17 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  UITextInputSessionLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v9;
    _os_log_debug_impl(&dword_185066000, v11, OS_LOG_TYPE_DEBUG, "[UITextInputSessionDynamicAccumulator] Created new accumulator with name %@!", buf, 0xCu);
  }

  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS____UITextInputSessionDynamicAccumulator;
  objc_msgSendSuper2(&v14, sel_accumulatorWithName_type_depthRange_block_, v9, 0, location, length, &__block_literal_global_555);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDynamicAccumulatorIncreaseBlock:", v10);

  return v12;
}

- (void)setDynamicAccumulatorIncreaseBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)increaseWithActions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  UITextInputSessionLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[_UITextInputSessionAccumulator name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_debug_impl(&dword_185066000, v5, OS_LOG_TYPE_DEBUG, "[UITextInputSessionDynamicAccumulator] increaseWithActions() called on %@!", (uint8_t *)&v8, 0xCu);

  }
  (*((void (**)(void))self->_dynamicAccumulatorIncreaseBlock + 2))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
    objc_storeStrong((id *)&self->_lastResults, v6);

}

- (NSArray)lastResults
{
  return self->_lastResults;
}

- (id)dynamicAccumulatorIncreaseBlock
{
  return self->_dynamicAccumulatorIncreaseBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dynamicAccumulatorIncreaseBlock, 0);
  objc_storeStrong((id *)&self->_lastResults, 0);
}

@end

@implementation _SBSystemApertureBackgroundActivitySuppressionAssertion

- (_SBSystemApertureBackgroundActivitySuppressionAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 backgroundActivitiesToSuppress:(id)a5 invalidationBlock:(id)a6
{
  id v10;
  _SBSystemApertureBackgroundActivitySuppressionAssertion *v11;
  uint64_t v12;
  NSSet *backgroundActivitiesToSuppress;

  v10 = a5;
  v11 = -[BSSimpleAssertion initWithIdentifier:forReason:invalidationBlock:](self, "initWithIdentifier:forReason:invalidationBlock:", a3, a4, a6);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    backgroundActivitiesToSuppress = v11->_backgroundActivitiesToSuppress;
    v11->_backgroundActivitiesToSuppress = (NSSet *)v12;

  }
  return v11;
}

- (NSSet)backgroundActivitiesToSuppress
{
  return self->_backgroundActivitiesToSuppress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivitiesToSuppress, 0);
}

@end

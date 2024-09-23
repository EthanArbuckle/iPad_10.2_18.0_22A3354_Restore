@implementation UIColor(WorkflowEditor_CrossPlatform)

+ (id)wf_slotTemplateSlotTitleColorWithTintColor:()WorkflowEditor_CrossPlatform
{
  return a3;
}

+ (id)wf_slotTemplateSlotRunningTitleColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEC1398], "colorWithP3RGBAValue:", 1034703103);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "platformColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)wf_slotTemplateSlotBackgroundColorWithTintColor:()WorkflowEditor_CrossPlatform
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "wf_slotTemplateSlotTitleColorWithTintColor:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.0700000003);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)wf_slotTemplateSlotHighlightedBackgroundColorWithTintColor:()WorkflowEditor_CrossPlatform
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "wf_slotTemplateSlotTitleColorWithTintColor:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.25);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)wf_slotTemplateSlotRunningBackgroundColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BEC1398], "colorWithP3RGBAValue:", 1289315583);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "platformColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.100000001);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)wf_slotTemplateSlotErrorBackgroundColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "wf_slotTemplateSlotErrorTitleColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.0599999987);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)wf_slotTemplateSlotErrorHighlightedBackgroundColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "wf_slotTemplateSlotErrorTitleColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.25);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end

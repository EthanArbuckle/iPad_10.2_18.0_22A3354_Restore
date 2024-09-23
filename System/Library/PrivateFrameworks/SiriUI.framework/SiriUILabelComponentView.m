@implementation SiriUILabelComponentView

+ (id)viewForComponent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[SiriUIDetailLabelComponentView viewForComponent:](SiriUIDetailLabelComponentView, "viewForComponent:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "labelForComponentModel:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    +[SiriUILabelComponentView viewForComponent:].cold.1(v7);
  v6 = 0;
LABEL_9:

  return v6;
}

+ (id)labelForComponentModel:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = a3;
  switch(objc_msgSend(v3, "style"))
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredHeadlineLabel");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1:
      objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredBodyLabel");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredSubheadLabel");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredCaptionLabel");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredFootnoteLabel");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
      objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredTitleLabel");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v5 = (void *)v4;
      break;
    default:
      v5 = 0;
      break;
  }
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setText:", v6);
  LODWORD(v7) = 1144750080;
  objc_msgSend(v5, "setContentHuggingPriority:forAxis:", 1, v7);
  LODWORD(v8) = 1144750080;
  objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 1, v8);
  objc_msgSend(v5, "sizeToFit");
  return v5;
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
  objc_storeStrong((id *)&self->_labels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
}

+ (void)viewForComponent:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  int v3;
  const char *v4;
  __int16 v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v3 = 136315394;
  v4 = "+[SiriUILabelComponentView viewForComponent:]";
  v5 = 2114;
  v6 = (id)objc_opt_class();
  v2 = v6;
  _os_log_error_impl(&dword_21764F000, v1, OS_LOG_TYPE_ERROR, "%s Unsupported Object for SiriUILabelComponentView %{public}@", (uint8_t *)&v3, 0x16u);

}

@end

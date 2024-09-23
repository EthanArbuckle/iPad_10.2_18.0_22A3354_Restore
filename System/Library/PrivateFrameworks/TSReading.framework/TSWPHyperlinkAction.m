@implementation TSWPHyperlinkAction

- (TSWPHyperlinkAction)initWithHyperlink:(id)a3 inRep:(id)a4 action:(id)a5
{
  TSWPHyperlinkAction *v7;
  objc_super v9;
  _QWORD v10[6];

  v10[1] = 3221225472;
  v10[2] = __54__TSWPHyperlinkAction_initWithHyperlink_inRep_action___block_invoke;
  v10[3] = &unk_24D82A5C8;
  v10[4] = a3;
  v10[5] = a4;
  v9.receiver = self;
  v9.super_class = (Class)TSWPHyperlinkAction;
  v10[0] = MEMORY[0x24BDAC760];
  v7 = -[TSWPTwoPartAction initWithStartAction:cancelAction:finishAction:](&v9, sel_initWithStartAction_cancelAction_finishAction_, v10, &__block_literal_global_65, a5);
  if (v7)
  {
    v7->_hyperlinkField = (TSWPHyperlinkField *)a3;
    v7->_hyperlinkRep = (TSWPHyperlinkHostRepProtocol *)a4;
  }
  return v7;
}

uint64_t __54__TSWPHyperlinkAction_initWithHyperlink_inRep_action___block_invoke(uint64_t a1)
{
  id v2;

  v2 = +[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController");
  objc_msgSend(v2, "endUISession");
  objc_msgSend(v2, "startUISessionForHyperlinkField:inRep:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return objc_msgSend(v2, "showHyperlinkHighlight");
}

uint64_t __54__TSWPHyperlinkAction_initWithHyperlink_inRep_action___block_invoke_2()
{
  return objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "endUISession");
}

+ (id)hyperlinkActionWithHyperlink:(id)a3 inRep:(id)a4 action:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithHyperlink:inRep:action:", a3, a4, a5);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPHyperlinkAction;
  -[TSWPTwoPartAction dealloc](&v3, sel_dealloc);
}

@end

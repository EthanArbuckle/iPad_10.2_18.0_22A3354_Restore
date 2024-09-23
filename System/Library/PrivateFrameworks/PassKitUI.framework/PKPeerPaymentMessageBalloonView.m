@implementation PKPeerPaymentMessageBalloonView

- (PKPeerPaymentMessageBalloonView)initWithBubbleView:(id)a3 peerPaymentType:(int64_t)a4
{
  id v7;
  PKPeerPaymentMessageBalloonView *v8;
  PKPeerPaymentMessageBalloonView *v9;
  id v10;
  CKTranscriptPluginBalloonView *balloonView;
  id v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentMessageBalloonView;
  v8 = -[PKPeerPaymentMessageBalloonView init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bubbleView, a3);
    v9->_peerPaymentType = a4;
    v10 = objc_alloc_init(getCKTranscriptPluginBalloonViewClass());
    objc_msgSend(v10, "setCanUseOpaqueMask:", 0);
    objc_msgSend(v10, "setTextAlignmentInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    objc_msgSend(v10, "setPluginView:", v7);
    objc_msgSend(v10, "setIsInteractive:", 1);
    balloonView = v9->_balloonView;
    v9->_balloonView = (CKTranscriptPluginBalloonView *)v10;
    v12 = v10;

    -[PKPeerPaymentMessageBalloonView _updateTailOrientation](v9, "_updateTailOrientation");
    -[CKTranscriptPluginBalloonView prepareForDisplay](v9->_balloonView, "prepareForDisplay");
    -[PKPeerPaymentMessageBalloonView addSubview:](v9, "addSubview:", v9->_balloonView);

  }
  return v9;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentMessageBalloonView;
  -[PKPeerPaymentMessageBalloonView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPeerPaymentMessageBalloonView bounds](self, "bounds");
  -[CKTranscriptPluginBalloonView setFrame:](self->_balloonView, "setFrame:");
}

- (void)setHasTail:(BOOL)a3
{
  -[CKTranscriptPluginBalloonView setHasTail:](self->_balloonView, "setHasTail:", a3);
}

- (void)_updateTailOrientation
{
  int64_t peerPaymentType;
  PKPeerPaymentBubbleView *bubbleView;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  PKPeerPaymentBubbleView *v11;
  id v12;

  -[objc_class sharedBehaviors](getCKUIBehaviorClass(), "sharedBehaviors");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  peerPaymentType = self->_peerPaymentType;
  if (peerPaymentType == 2)
  {
    -[CKTranscriptPluginBalloonView setHasTail:](self->_balloonView, "setHasTail:", 1);
    -[CKTranscriptPluginBalloonView setOrientation:](self->_balloonView, "setOrientation:", 0);
    v5 = v12;
    bubbleView = self->_bubbleView;
    if (v12)
    {
      v6 = 0;
      goto LABEL_7;
    }
LABEL_9:
    v7 = *MEMORY[0x1E0DC49E8];
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    goto LABEL_10;
  }
  if (peerPaymentType == 1)
  {
    -[CKTranscriptPluginBalloonView setHasTail:](self->_balloonView, "setHasTail:", 1);
    -[CKTranscriptPluginBalloonView setOrientation:](self->_balloonView, "setOrientation:", 1);
    bubbleView = self->_bubbleView;
    v5 = v12;
    if (v12)
    {
      v6 = 1;
LABEL_7:
      objc_msgSend(v5, "pluginBalloonInsetsForMessageFromMe:", v6);
LABEL_10:
      v11 = bubbleView;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  -[CKTranscriptPluginBalloonView setHasTail:](self->_balloonView, "setHasTail:", 0);
  v11 = self->_bubbleView;
  v7 = *MEMORY[0x1E0DC49E8];
  v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v9 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v10 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
LABEL_11:
  -[PKPeerPaymentBubbleView setContentInset:](v11, "setContentInset:", v7, v8, v9, v10);

}

- (PKPeerPaymentBubbleView)bubbleView
{
  return self->_bubbleView;
}

- (int64_t)peerPaymentType
{
  return self->_peerPaymentType;
}

- (CKTranscriptPluginBalloonView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
  objc_storeStrong((id *)&self->_balloonView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balloonView, 0);
  objc_storeStrong((id *)&self->_bubbleView, 0);
}

@end

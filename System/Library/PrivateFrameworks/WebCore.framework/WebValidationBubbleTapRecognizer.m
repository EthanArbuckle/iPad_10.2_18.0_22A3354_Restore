@implementation WebValidationBubbleTapRecognizer

- (WebValidationBubbleTapRecognizer)initWithPopoverController:(id)a3
{
  WebValidationBubbleTapRecognizer *v4;
  void *m_ptr;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WebValidationBubbleTapRecognizer;
  v4 = -[WebValidationBubbleTapRecognizer init](&v9, sel_init);
  if (v4)
  {
    if (a3)
      CFRetain(a3);
    m_ptr = v4->_popoverController.m_ptr;
    v4->_popoverController.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
    v6 = objc_msgSend(objc_alloc((Class)PAL::getUITapGestureRecognizerClass[0]((PAL *)m_ptr)), "initWithTarget:action:", v4, sel_dismissPopover);
    v7 = v4->_tapGestureRecognizer.m_ptr;
    v4->_tapGestureRecognizer.m_ptr = (void *)v6;
    if (v7)
      CFRelease(v7);
    objc_msgSend((id)objc_msgSend(v4->_popoverController.m_ptr, "view"), "addGestureRecognizer:", v4->_tapGestureRecognizer.m_ptr);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(self->_popoverController.m_ptr, "view"), "removeGestureRecognizer:", self->_tapGestureRecognizer.m_ptr);
  v3.receiver = self;
  v3.super_class = (Class)WebValidationBubbleTapRecognizer;
  -[WebValidationBubbleTapRecognizer dealloc](&v3, sel_dealloc);
}

- (void)dismissPopover
{
  objc_msgSend(self->_popoverController.m_ptr, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;

  m_ptr = self->_tapGestureRecognizer.m_ptr;
  self->_tapGestureRecognizer.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_popoverController.m_ptr;
  self->_popoverController.m_ptr = 0;
  if (v4)
    CFRelease(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end

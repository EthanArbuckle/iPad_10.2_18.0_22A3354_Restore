@implementation RWIProtocolInspector

- (RWIProtocolInspector)initWithController:(AugmentableInspectorController *)a3
{
  RWIProtocolInspector *v4;
  RWIProtocolInspector *v5;
  RWIAugmentableInspectorControllerClient *v6;
  RWIAugmentableInspectorControllerClient *value;
  RWIProtocolConfiguration *v8;
  void *m_ptr;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RWIProtocolInspector;
  v4 = -[RWIProtocolInspector init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_inspectorController = a3;
    v6 = (RWIAugmentableInspectorControllerClient *)operator new();
    *(_QWORD *)v6 = &off_24DE01C78;
    *((_QWORD *)v6 + 1) = v5;
    value = v5->_inspectorControllerClient.__ptr_.__value_;
    v5->_inspectorControllerClient.__ptr_.__value_ = v6;
    if (value)
    {
      MEMORY[0x22075766C](value, 0x81C40803F642BLL);
      v6 = v5->_inspectorControllerClient.__ptr_.__value_;
    }
    (*((void (**)(AugmentableInspectorController *, RWIAugmentableInspectorControllerClient *))v5->_inspectorController->var0
     + 3))(v5->_inspectorController, v6);
    v8 = -[RWIProtocolConfiguration initWithController:]([RWIProtocolConfiguration alloc], "initWithController:", a3);
    m_ptr = v5->_configuration.m_ptr;
    v5->_configuration.m_ptr = v8;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v5;
}

- (void)dealloc
{
  AugmentableInspectorController *inspectorController;
  objc_super v4;

  inspectorController = self->_inspectorController;
  if (inspectorController)
    (*((void (**)(AugmentableInspectorController *, _QWORD))inspectorController->var0 + 3))(inspectorController, 0);
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolInspector;
  -[RWIProtocolInspector dealloc](&v4, sel_dealloc);
}

- (RWIProtocolConfiguration)configuration
{
  return (RWIProtocolConfiguration *)self->_configuration.m_ptr;
}

- (BOOL)connected
{
  AugmentableInspectorController *inspectorController;

  inspectorController = self->_inspectorController;
  if (inspectorController)
    LOBYTE(inspectorController) = *(_DWORD *)((*((uint64_t (**)(AugmentableInspectorController *, SEL))inspectorController->var0
                                               + 4))(inspectorController, a2)+ 20) != 0;
  return (char)inspectorController;
}

- (void)inspectorControllerDestroyed
{
  RWIAugmentableInspectorControllerClient *value;

  self->_inspectorController = 0;
  value = self->_inspectorControllerClient.__ptr_.__value_;
  self->_inspectorControllerClient.__ptr_.__value_ = 0;
  if (value)
    JUMPOUT(0x22075766CLL);
}

- (void).cxx_destruct
{
  RWIAugmentableInspectorControllerClient *value;
  void *m_ptr;

  value = self->_inspectorControllerClient.__ptr_.__value_;
  self->_inspectorControllerClient.__ptr_.__value_ = 0;
  if (value)
    MEMORY[0x22075766C](value, 0x81C40803F642BLL);
  m_ptr = self->_configuration.m_ptr;
  self->_configuration.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end

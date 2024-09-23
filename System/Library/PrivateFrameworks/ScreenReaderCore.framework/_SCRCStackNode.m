@implementation _SCRCStackNode

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->_object, a3);
}

- (_SCRCStackNode)prev
{
  return (_SCRCStackNode *)objc_loadWeakRetained((id *)&self->_prev);
}

- (void)setPrev:(id)a3
{
  objc_storeWeak((id *)&self->_prev, a3);
}

- (_SCRCStackNode)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
  objc_storeStrong((id *)&self->_next, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_next, 0);
  objc_destroyWeak((id *)&self->_prev);
  objc_storeStrong(&self->_object, 0);
}

@end

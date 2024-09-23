@implementation ZNK3ctu20SharedSynchronizableI19ARITransportServiceE20execute

_QWORD *___ZNK3ctu20SharedSynchronizableI19ARITransportServiceE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke(uint64_t a1)
{
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(**(_QWORD **)(a1 + 40) + 16))(*(_QWORD **)(a1 + 40));
}

AriHostRt *___ZNK3ctu20SharedSynchronizableI19ARITransportServiceE20execute_wrapped_syncIZNS1_9dumpStateEvE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS5__block_invoke(AriHostRt *this)
{
  if (*(_QWORD *)(**((_QWORD **)this + 5) + 136))
    return (AriHostRt *)AriHostRt::DumpState(this);
  return this;
}

@end

@implementation PRSuperframeStats

- (PRSuperframeStats)initWithStats:(const void *)a3
{
  PRSuperframeStats *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PRSuperframeStats;
  v4 = -[PRSuperframeStats init](&v10, sel_init);
  if (v4)
  {
    std::allocate_shared[abi:ne180100]<rose::ResponderSuperframeStats,std::allocator<rose::ResponderSuperframeStats>,rose::ResponderSuperframeStats const&,void>((uint64_t *)a3, &v9);
    std::shared_ptr<rose::ResponderSuperframeStats>::operator=[abi:ne180100]((uint64_t)&v4->_stats, &v9);
    v5 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
    if (*((_QWORD *)&v9 + 1))
    {
      v6 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  return v4;
}

- (ResponderSuperframeStats)stats
{
  ResponderSuperframeStats *ptr;
  unsigned __int16 var1;
  int var0_low;
  ResponderSuperframeCompleteEvent var2;
  __int128 v8;
  ResponderSuperframeCompleteEvent v9;
  ResponderSuperframeStats *result;

  ptr = self->_stats.__ptr_;
  var1 = ptr->var1;
  retstr->var0 = ptr->var0;
  retstr->var1 = var1;
  var0_low = LODWORD(ptr[2].var0);
  v8 = *(_OWORD *)&ptr[1].var0;
  var2 = ptr[1].var2;
  v9 = ptr->var2;
  *(_QWORD *)&retstr[2].var1 = 0;
  retstr = (ResponderSuperframeStats *)((char *)retstr + 72);
  *(ResponderSuperframeCompleteEvent *)&retstr[-2].var1 = v9;
  *(_OWORD *)&retstr[-2].var2.var3 = v8;
  *(ResponderSuperframeCompleteEvent *)&retstr[-1].var1 = var2;
  LODWORD(retstr[-1].var2.var3) = var0_low;
  *(_QWORD *)&retstr->var1 = 0;
  *(_QWORD *)&retstr->var2.var0 = 0;
  result = (ResponderSuperframeStats *)std::vector<Rose::ResponderSuperframeRxPacketInfo>::__init_with_size[abi:ne180100]<Rose::ResponderSuperframeRxPacketInfo*,Rose::ResponderSuperframeRxPacketInfo*>(retstr, *(const void **)&ptr[2].var1, *(_QWORD *)&ptr[2].var2.var0, (uint64_t)(*(_QWORD *)&ptr[2].var2.var0 - *(_QWORD *)&ptr[2].var1) >> 4);
  *(_OWORD *)&retstr->var2.var3 = *(_OWORD *)&ptr[3].var0;
  return result;
}

- (void).cxx_destruct
{
  std::shared_ptr<rose::ResponderSuperframeStats>::~shared_ptr[abi:ne180100]((uint64_t)&self->_stats);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end

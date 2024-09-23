@implementation PKQuadTree

- (void).cxx_destruct
{
  std::shared_ptr<QuadTree>::~shared_ptr[abi:ne180100]((uint64_t)&self->quadTree);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end

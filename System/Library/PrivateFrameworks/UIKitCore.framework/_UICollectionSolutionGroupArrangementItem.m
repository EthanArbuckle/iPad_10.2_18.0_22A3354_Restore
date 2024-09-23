@implementation _UICollectionSolutionGroupArrangementItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_solution, 0);
}

- (_QWORD)item
{
  _QWORD *v1;

  if (a1)
  {
    v1 = (_QWORD *)a1[1];
    if (v1)
      v1 = (_QWORD *)v1[2];
    a1 = v1;
  }
  return a1;
}

@end

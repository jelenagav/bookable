class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def edit?
    return true
  end

  def update?
    return true
  end

  def show?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end

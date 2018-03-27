# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
def find(id)
  # Your code Here
  @candidates.each do |candidate|
    if candidate[:id] == id
      return candidate
    else
      return nil
    end
  end
end

def experienced?(candidate)
  # Your code Here
 candidate[:years_of_experience] >= 2
end

def qualified_candidates(candidates)
  # Your code Here
  qualified = []
  candidates.each do |candidate|
    if (experienced?(candidate) && candidate[:github_points] >= 100 && (candidate[:languages].include?("Ruby")||candidate[:languages].include?("Python")) && (candidate[:age] >= 18) && (Date.today - candidate[:date_applied] <= 15))
      qualified << candidate
    else
      nil
    end
  end
  return qualified
end

# More methods will go below
def ordered_by_qualifications candidates
  #candidates.sort_by { |candidate| candidate[:years_of_experience], candidate[:github_points] }
  candidates.sort! do |a, b|
    (b[:years_of_experience] <=> a[:years_of_experience]).nonzero? ||
    (b[:github_points] <=> a[:github_points])
  end
end
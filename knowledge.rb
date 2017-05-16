def attribute(m_name, &block)
  m_name, val = m_name.first if m_name.is_a? Hash

  define_method "#{m_name}?" do
  	instance_variable_get("@#{m_name}".to_sym) ? true : false
  end

  define_method "#{m_name}=" do |val|
  	instance_variable_set("@#{m_name}".to_sym, val)
  end

  define_method "#{m_name}" do
  	if instance_variables.include? "@#{m_name}".to_sym
  	   instance_variable_get "@#{m_name}"
  	else
  	  instance_variable_set("@#{m_name}", block ? (instance_eval &block) : val)
  	end
  end
end

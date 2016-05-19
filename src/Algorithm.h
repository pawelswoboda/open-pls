#ifndef ALGORITHM_H
#define ALGORITHM_H

#include <string>

class Algorithm
{
public:
    Algorithm(std::string const &algname) : m_sName(algname) {}
    virtual ~Algorithm() {}

    virtual bool Run() = 0;
    std::string GetName() const { return m_sName; }

protected:
    std::string const m_sName;
};

#endif //ALGORITHM_H
